import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../domain.dart';

class JokeByCategoryUsecase {
  final JokeByCategoryInterface _repository;

  JokeByCategoryUsecase(this._repository);

  Future<Either<Failure, JokeEntity>> getJokeByCategory(
    String category,
  ) async {
    return await _repository.getJokeByCategory(category);
  }
}
