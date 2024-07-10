import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/core/usecase/usecases.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';
import 'package:pokedex/features/home/domain/repository/home_repository.dart';

class GetPokemons implements UseCase<List<Pokemon>, FetchPokemonsParms> {
  final HomeRepository _repository;

  GetPokemons({required HomeRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<Pokemon>>> call(FetchPokemonsParms params) async {
    return await _repository
        .getPokemons(params.limit, params.offset)
        .fold((l) => left(l), (r) async => right(await r));
  }
}

class FetchPokemonsParms {
  final int limit;
  final int offset;

  FetchPokemonsParms({required this.limit, required this.offset});
}
