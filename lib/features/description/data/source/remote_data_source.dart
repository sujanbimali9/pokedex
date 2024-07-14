import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';

import 'package:pokedex/core/exception/exeption.dart';
import 'package:pokedex/features/description/data/model/pokemon_detail_model.dart';
import 'package:http/http.dart' as http;

abstract interface class DescriptionDataSource {
  Future<PokemonDetailsModel> getPokemonDetails(String id);
}

class DescriptionDataSourceImp implements DescriptionDataSource {
  @override
  Future<PokemonDetailsModel> getPokemonDetails(String id) async {
    try {
      final future = <Future<http.Response>>[];
      final species = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$id/'));

      final pokemonDetailFuture =
          http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id/'));

      final evolutionChainFuture = http
          .get(Uri.parse(jsonDecode(species.body)['evolution_chain']['url']));

      future.add(pokemonDetailFuture);
      future.add(evolutionChainFuture);

      final res = await Future.wait(future);
      for (var response in res) {
        if (response.statusCode != 200) {
          throw ServerException('Failed to load data');
        }
      }
      return PokemonDetailsModel.fromJson(
        pokemonDetail: jsonDecode(res[0].body) as Map<String, dynamic>,
        evolutionChain: jsonDecode(res[1].body) as Map<String, dynamic>,
        species: jsonDecode(species.body) as Map<String, dynamic>,
      );
    } on ServerException {
      rethrow;
    } on http.ClientException catch (e) {
      log('error ${e.message}');
      throw ServerException(e.message);
    } catch (e) {
      log('error $e');
      throw ServerException(e.toString());
    }
  }
}

class DescriptionDataSourceImpIsolates extends DescriptionDataSource {
  @override
  Future<PokemonDetailsModel> getPokemonDetails(String id) async {
    try {
      final ReceivePort port = ReceivePort();

      PokemonDetailsModel? pokemons;

      Isolate.spawn(_fetchPokemonIsolate, (port.sendPort, id));

      final completer = Completer();
      port.listen((message) {
        if (message is PokemonDetailsModel) {
          pokemons = message;
          completer.complete();
        } else if (message is ServerException) {
          completer.completeError(message);
        }
      });

      await Future.wait([completer.future]);
      port.close();

      if (pokemons == null) {
        throw ServerException('Failed to fetch Pokémon details');
      }

      return pokemons!;
    } on ServerException {
      rethrow;
    } on http.ClientException catch (e) {
      log('error ${e.message}');
      throw ServerException(e.message);
    } catch (e) {
      log('error $e');
      throw ServerException(e.toString());
    }
  }

  _fetchPokemonIsolate((SendPort, String) args) async {
    final SendPort sendPort = args.$1;
    final String pokemonId = args.$2;

    try {
      final http.Response species = await http.get(
          Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$pokemonId'));

      if (species.statusCode != 200) {
        throw ServerException(
            'Failed to fetch Pokémon details for id $pokemonId');
      }
      final future = <Future<http.Response>>[];

      final pokemonDetailFuture =
          http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId/'));

      final evolutionChainFuture = http
          .get(Uri.parse(jsonDecode(species.body)['evolution_chain']['url']));

      future.add(pokemonDetailFuture);
      future.add(evolutionChainFuture);

      final res = await Future.wait(future);

      for (var response in res) {
        if (response.statusCode != 200) {
          throw ServerException('Failed to load data');
        }
      }
      final pokemonDetail = PokemonDetailsModel.fromJson(
        pokemonDetail: jsonDecode(res[0].body) as Map<String, dynamic>,
        evolutionChain: jsonDecode(res[1].body) as Map<String, dynamic>,
        species: jsonDecode(species.body) as Map<String, dynamic>,
      );
      sendPort.send(pokemonDetail);
    } catch (e) {
      log('Isolate Error: Failed to fetch Pokémon details for id $pokemonId');
      sendPort.send(ServerException('Failed to fetch Pokémon details'));
    }
  }
}
