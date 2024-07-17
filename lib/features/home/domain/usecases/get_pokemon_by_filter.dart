import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/core/usecase/usecases.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';
import 'package:pokedex/features/home/domain/repository/home_repository.dart';

class GetPokemonByFilter implements UseCase<List<Pokemon>, FilterPokemonParm> {
  final HomeRepository _repository;
  GetPokemonByFilter({required HomeRepository repository})
      : _repository = repository;
  @override
  Future<Either<Failure, List<Pokemon>>> call(parms) async {
    return _repository.getPokemonByFilter(
      parms.limit,
      parms.offset,
      parms.query,
    );
  }
}

class FilterPokemonParm {
  final int limit;
  final int offset;
  final Map<String, Object> query;
  FilterPokemonParm({
    required this.limit,
    required this.offset,
    required this.query,
  });
}
