import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons(int limit, int offset);
  Future<Either<Failure, List<Pokemon>>> searchPokemons(String query);
  Future<Either<Failure, List<Pokemon>>> getPokemonByFilter(
      int limit, int offset, Map<String, Object> query);
}
