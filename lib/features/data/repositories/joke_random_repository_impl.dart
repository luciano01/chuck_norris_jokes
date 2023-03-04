import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class JokeRandomRepositoryImpl implements JokeRandomInterface {
  final JokeRandomRemoteDataSource jokeRandomRemoteDataSource;
  final NetworkInfo networkInfo;

  JokeRandomRepositoryImpl({
    required this.jokeRandomRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, JokeModel>> getJokeRandom() async {
    if (await networkInfo.hasConnection) {
      try {
        final remoteJoke = await jokeRandomRemoteDataSource.getJokeRandom();
        return Right(remoteJoke);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
