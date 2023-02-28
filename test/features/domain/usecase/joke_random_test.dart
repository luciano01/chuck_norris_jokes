import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_norris_jokes/features/domain/domain.dart';

class MockJokeRandomInterface extends Mock implements JokeRandomInterface {}

void main() {
  late JokeRandomUsecase usecase;
  late MockJokeRandomInterface mockJokeRandomInterface;

  setUp(() {
    mockJokeRandomInterface = MockJokeRandomInterface();
    usecase = JokeRandomUsecase(mockJokeRandomInterface);
  });

  const jokeRandom = JokeEntity(
    categories: [],
    createdAt: '',
    iconUrl: '',
    id: '',
    updatedAt: '',
    url: '',
    value: '',
  );

  test(
    'Should get a random joke from the [JokeRandomInterface]',
    () async {
      when(() => mockJokeRandomInterface.getJokeRandom())
          .thenAnswer((_) async => const Right(jokeRandom));

      final result = await usecase.getJokeRandom();

      expect(result, const Right(jokeRandom));

      verify(() => mockJokeRandomInterface.getJokeRandom());
      verifyNoMoreInteractions(mockJokeRandomInterface);
    },
  );
}
