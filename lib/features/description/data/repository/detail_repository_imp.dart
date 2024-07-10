import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/core/error/server_error.dart';
import 'package:pokedex/core/exception/exeption.dart';
import 'package:pokedex/features/description/data/source/remote_data_source.dart';
import 'package:pokedex/features/description/domain/entity/pokemon_detail.dart';
import 'package:pokedex/features/description/domain/repository/detail_repository.dart';

class DetailRepositoryImp implements DetailRepository {
  final DescriptionDataSource _dataSource;

  DetailRepositoryImp({required DescriptionDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, PokemonDetail>> getPokemonDetail(String id) async {
    try {
      return right(await _dataSource.getPokemonDetails(id));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }
}
