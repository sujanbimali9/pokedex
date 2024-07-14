import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons(int limit, int offset);
}
