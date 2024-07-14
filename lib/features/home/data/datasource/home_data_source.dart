import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:developer';

import 'package:pokedex/core/exception/exeption.dart';
import 'package:pokedex/features/home/data/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeDataSource {
  Future<List<PokemonModel>> getPokemons(int limit, int offset);
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<List<PokemonModel>> getPokemons(int limit, int offset) async {
    log('HomeDataSourceImpl.getPokemons: Fetching list of Pokémons with limit $limit and offset $offset');
    try {
      var detailRequests = List.generate(
          limit,
          (index) => http.get(Uri.parse(
              'https://pokeapi.co/api/v2/pokemon-form/${index + 1 + offset}')));

      var detailResponses = await Future.wait(detailRequests);

      var pokemons = detailResponses.map((detailResponse) {
        if (detailResponse.statusCode != 200) {
          log('HomeDataSourceImpl.getPokemons: Failed to fetch Pokémon details for one or more Pokémons');
          throw ServerException('Failed to fetch Pokémon details');
        }
        return PokemonModel.fromJson(jsonDecode(detailResponse.body));
      }).toList();

      log('HomeDataSourceImpl.getPokemons: Successfully fetched details for all Pokémons');
      return pokemons;
    } on ServerException {
      rethrow;
    } on http.ClientException catch (e) {
      log('HomeDataSourceImpl.getPokemons: HTTP ClientException - ${e.message}');
      throw ServerException('HTTP ClientException: ${e.message}');
    } catch (e) {
      log('HomeDataSourceImpl.getPokemons: Unexpected error - $e');
      throw ServerException('Unexpected error: $e');
    }
  }
}

class HomeDataSourceImplIsolates implements HomeDataSource {
  @override
  Future<List<PokemonModel>> getPokemons(int limits, int offset) async {
    log('HomeDataSourceImplIsolates.getPokemons: Fetching list of Pokémons with limit $limits and offset $offset');
    try {
      final limit = limits + offset >= 1025 ? (1025 - offset) : limits;
      final List<PokemonModel> pokemons = [];
      final List<ReceivePort> ports =
          List.generate(limit, (_) => ReceivePort());

      List.generate(
        limit,
        (index) {
          final port = ports[index];
          return Isolate.spawn(
            onError: port.sendPort,
            _fetchPokemonIsolate,
            {'sendPort': port.sendPort, 'pokemonId': index + 1 + offset},
          );
        },
      );

      final List<Future<void>> listeningFutures = ports.map(
        (port) {
          final completer = Completer<void>();
          port.listen(
            (message) {
              if (message is PokemonModel) {
                pokemons.add(message);
                completer.complete();
              } else if (message is ServerException) {
                log('HomeDataSourceImplIsolates.getPokemons: Failed to fetch Pokémon details for one or more Pokémons');
                completer.completeError(message);
              }
            },
          );
          return completer.future;
        },
      ).toList();
      await Future.wait(listeningFutures);
      for (var port in ports) {
        port.close();
      }
      log('HomeDataSourceImplIsolates.getPokemons: Fetched ${pokemons.length} Pokémons successfully');
      return pokemons..sort((a, b) => a.id.compareTo(b.id));
    } on ServerException {
      rethrow;
    } on http.ClientException catch (e) {
      log('HomeDataSourceImplIsolates.getPokemons: HTTP ClientException - ${e.message}');
      throw ServerException('HTTP ClientException: ${e.message}');
    } catch (e) {
      log('HomeDataSourceImplIsolates.getPokemons: Unexpected error - $e');
      throw ServerException('Unexpected error: $e');
    }
  }

  static void _fetchPokemonIsolate(Map<String, dynamic> args) async {
    final SendPort sendPort = args['sendPort'];
    final int pokemonId = args['pokemonId'];

    try {
      final http.Response response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-form/$pokemonId'));
      final PokemonModel pokemon =
          PokemonModel.fromJson(jsonDecode(response.body));
      sendPort.send(pokemon);
    } catch (e) {
      log('Isolate Error: Failed to fetch Pokémon details for id $pokemonId');
      sendPort.send(ServerException('Failed to fetch Pokémon details'));
    }
  }
}
