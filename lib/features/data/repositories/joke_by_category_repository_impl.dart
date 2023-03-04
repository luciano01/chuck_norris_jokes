import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/domain.dart';
import '../data.dart';

class JokeByCategoryRepositoryImpl implements JokeByCategoryInterface {
  @override
  Future<Either<Failure, JokeModel>> getJokeByCategory(
    String category,
  ) {
    throw UnimplementedError();
  }
}
