import 'package:dartz/dartz.dart';

import 'package:chuck_norris_jokes/core/error/failure_interface.dart';

import '../../domain/domain.dart';

class JokeByCategoryRepositoryImpl implements JokeByCategoryInterface {
  @override
  Future<Either<FailureInterface, JokeEntity>> getJokeByCategory(
    String category,
  ) {
    throw UnimplementedError();
  }
}
