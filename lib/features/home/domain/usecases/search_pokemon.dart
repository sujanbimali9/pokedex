import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/core/usecase/usecases.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';
import 'package:pokedex/features/home/domain/repository/home_repository.dart';

class SearchPokemonsInSupabase implements UseCase<List<Pokemon>, String> {
  final HomeRepository repository;

  SearchPokemonsInSupabase(this.repository);
  @override
  Future<Either<Failure, List<Pokemon>>> call(String parms) async {
    return await repository.searchPokemons(parms);
  }
}
