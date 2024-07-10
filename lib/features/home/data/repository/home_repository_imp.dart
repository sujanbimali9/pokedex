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
  Either<Failure, Future<List<Pokemon>>> getPokemons(int limit, int offset) {
    try {
      final pokemons = _dataSource.getPokemons(limit, offset);
      return right(pokemons);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
