import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/features/description/domain/entity/pokemon_detail.dart';

abstract interface class DetailRepository {
  Future<Either<Failure, PokemonDetail>> getPokemonDetail(String name);
}
