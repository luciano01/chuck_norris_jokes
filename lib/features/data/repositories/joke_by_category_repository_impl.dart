import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class JokeByCategoryRepositoryImpl implements JokeByCategoryInterface {
  final JokeByCategoryRemoteDataSource jokeByCategoryRemoteDataSource;
  final NetworkInfo networkInfo;

  JokeByCategoryRepositoryImpl({
    required this.jokeByCategoryRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, JokeModel>> getJokeByCategory(
    String category,
  ) async {
    if (await networkInfo.hasConnection) {
      try {
        final byCategoryJoke =
            await jokeByCategoryRemoteDataSource.getJokeByCategory(category);
        return Right(byCategoryJoke);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
