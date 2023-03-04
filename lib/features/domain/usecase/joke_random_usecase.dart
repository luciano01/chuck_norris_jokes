import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../domain.dart';

class JokeRandomUsecase {
  final JokeRandomInterface _repository;

  JokeRandomUsecase(this._repository);

  Future<Either<Failure, JokeEntity>> getJokeRandom() async {
    return await _repository.getJokeRandom();
  }
}
