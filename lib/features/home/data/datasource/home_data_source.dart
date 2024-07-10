import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedex/core/exception/exeption.dart';
import 'package:pokedex/features/home/data/model/pokemon_model.dart';

abstract class HomeDataSource {
  Future<List<PokemonModel>> getPokemons(int limit, int offset);
}

class HomeDataSourceImpl implements HomeDataSource {
  final Dio _dio;

  HomeDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<PokemonModel>> getPokemons(int limit, int offset) async {
    try {
      final response = await _dio.get(
        'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset',
      );

      final List results = response.data['results'];

      var detailRequests = results.map((pokemon) {
        return _dio
            .get('https://pokeapi.co/api/v2/pokemon-form/${pokemon['name']}');
      });

      List<Response> detailResponses = await Future.wait(detailRequests);
      List<PokemonModel> pokemons = detailResponses.map((detailResponse) {
        return PokemonModel.fromJson(detailResponse.data);
      }).toList();

      return pokemons;
    } on DioException catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    } on Exception catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    } on Error catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }
}
