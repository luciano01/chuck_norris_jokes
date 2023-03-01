import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../domain.dart';

abstract class JokeByCategoryInterface {
  Future<Either<FailureInterface, JokeEntity>> getJokeByCategory(
    String category,
  );
}
