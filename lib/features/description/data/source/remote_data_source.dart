import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedex/core/exception/exeption.dart';
import 'package:pokedex/features/description/data/model/pokemon_detail_model.dart';

abstract interface class DescriptionDataSource {
  Future<PokemonDetailsModel> getPokemonDetails(String id);
}

class DescriptionDataSourceImp implements DescriptionDataSource {
  final Dio _dio;

  DescriptionDataSourceImp({required Dio dio}) : _dio = dio;
  @override
  Future<PokemonDetailsModel> getPokemonDetails(String id) async {
    try {
      final future = <Future<Response<dynamic>>>[];
      final species =
          await _dio.get('https://pokeapi.co/api/v2/pokemon-species/$id/');

      final pokemonDetailFuture =
          _dio.get('https://pokeapi.co/api/v2/pokemon/$id/');

      final evolutionChainFuture =
          _dio.get(species.data['evolution_chain']['url']);

      future.add(pokemonDetailFuture);
      future.add(evolutionChainFuture);

      final res = await Future.wait(future);

      return PokemonDetailsModel.fromJson(
        pokemonDetail: res[0].data as Map<String, dynamic>,
        evolutionChain: res[1].data as Map<String, dynamic>,
        species: species.data as Map<String, dynamic>,
      );
    } catch (e) {
      log('error $e');
      throw ServerException(e.toString());
    }
  }
}
