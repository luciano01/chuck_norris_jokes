import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../domain.dart';

abstract class JokeRandomInterface {
  Future<Either<Failure, JokeEntity>> getJokeRandom();
}
