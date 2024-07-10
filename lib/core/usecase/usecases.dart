import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/error/failure.dart';

abstract interface class UseCase<Success, Parms> {
  Future<Either<Failure, Success>> call(Parms parms);
}
