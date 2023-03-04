import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_norris_jokes/core/core.dart';
import 'package:chuck_norris_jokes/features/data/data.dart';

class MockJokeByCategoryRemoteDataSource extends Mock
    implements JokeByCategoryRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late JokeByCategoryRepositoryImpl repositoryImpl;
  late MockJokeByCategoryRemoteDataSource mockJokeByCategoryRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockJokeByCategoryRemoteDataSource = MockJokeByCategoryRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = JokeByCategoryRepositoryImpl(
      jokeByCategoryRemoteDataSource: mockJokeByCategoryRemoteDataSource,
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

  const category = 'food';

  group('Device has network connection', () {
    setUp(() {
      when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => true);
    });

    test('Should return the data from [JokeByCategoryRemoteDataSource]',
        () async {
      when(() => mockJokeByCategoryRemoteDataSource.getJokeByCategory(category))
          .thenAnswer((_) async => jokeRandom);

      final result = await repositoryImpl.getJokeByCategory(category);

      verify(
          () => mockJokeByCategoryRemoteDataSource.getJokeByCategory(category));
      expect(result, equals(const Right(jokeRandom)));
    });
  });

  group('Device has no network connection', () {
    setUp(() {
      when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => false);
    });

    test('Should throw [ServerException]', () async {
      when(() => mockJokeByCategoryRemoteDataSource.getJokeByCategory(category))
          .thenThrow(ServerException());

      final result = await repositoryImpl.getJokeByCategory(category);

      expect(result, equals(Left(ServerFailure())));
      verifyNoMoreInteractions(mockJokeByCategoryRemoteDataSource);
    });
  });
}
