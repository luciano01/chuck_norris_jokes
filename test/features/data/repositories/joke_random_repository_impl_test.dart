import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_norris_jokes/core/core.dart';
import 'package:chuck_norris_jokes/features/data/data.dart';

class MockJokeRandomRemoteDataSource extends Mock
    implements JokeRandomRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late JokeRandomRepositoryImpl repositoryImpl;
  late MockJokeRandomRemoteDataSource mockJokeRandomRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockJokeRandomRemoteDataSource = MockJokeRandomRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = JokeRandomRepositoryImpl(
      jokeRandomRemoteDataSource: mockJokeRandomRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const jokeRandom = JokeModel(
    categories: [],
    createdAt: '',
    iconUrl: '',
    id: '',
    updatedAt: '',
    url: '',
    value: '',
  );

  group('Device has network connection', () {
    setUp(() {
      when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => true);
    });

    test('Should return the data from [JokeRandomRemoteDataSource]', () async {
      when(() => mockJokeRandomRemoteDataSource.getJokeRandom())
          .thenAnswer((_) async => jokeRandom);

      final result = await repositoryImpl.getJokeRandom();

      verify(() => mockJokeRandomRemoteDataSource.getJokeRandom());
      expect(result, equals(const Right(jokeRandom)));
    });
  });

  group('Device has no network connection', () {
    setUp(() {
      when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => false);
    });

    test('Should throw [ServerException]', () async {
      when(() => mockJokeRandomRemoteDataSource.getJokeRandom())
          .thenThrow(ServerException());

      final result = await repositoryImpl.getJokeRandom();

      expect(result, equals(Left(ServerFailure())));
      verifyNoMoreInteractions(mockJokeRandomRemoteDataSource);
    });
  });
}
