import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_norris_jokes/core/core.dart';
import 'package:chuck_norris_jokes/features/data/data.dart';

class MockJokeRandomRemoteDataSource extends Mock
    implements JokeRandomRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  JokeRandomRepositoryImpl repositoryImpl;
  MockJokeRandomRemoteDataSource mockJokeRandomRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockJokeRandomRemoteDataSource = MockJokeRandomRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = JokeRandomRepositoryImpl(
      jokeRandomRemoteDataSource: mockJokeRandomRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
