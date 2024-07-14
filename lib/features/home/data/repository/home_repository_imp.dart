import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/core/error/server_error.dart';
import 'package:pokedex/core/exception/exeption.dart';
import 'package:pokedex/features/home/data/datasource/home_data_source.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';
import 'package:pokedex/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepositoryImp({required HomeDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons(
      int limit, int offset) async {
    log('HomeRepositoryImp.getPokemons: Start fetching Pokémon list with limit $limit and offset $offset');
    try {
      final pokemons = await _dataSource.getPokemons(limit, offset);
      log('HomeRepositoryImp.getPokemons: Successfully fetched Pokémon list');
      return right(pokemons);
    } on ServerException catch (e) {
      log('HomeRepositoryImp.getPokemons: ServerException - ${e.message}');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('HomeRepositoryImp.getPokemons: Unexpected error - $e');
      return left(ServerFailure(message: e.toString()));
    }
  }
}
