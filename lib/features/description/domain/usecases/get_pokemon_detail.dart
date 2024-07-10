import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/core/usecase/usecases.dart';
import 'package:pokedex/features/description/domain/entity/pokemon_detail.dart';
import 'package:pokedex/features/description/domain/repository/detail_repository.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';

class GetPokemonDetail implements UseCase<PokemonDetail, Pokemon> {
  final DetailRepository _repository;

  GetPokemonDetail({required DetailRepository repository})
      : _repository = repository;
  @override
  Future<Either<Failure, PokemonDetail>> call(Pokemon parms) async {
    return await _repository.getPokemonDetail(parms.id.toString());
  }
}
