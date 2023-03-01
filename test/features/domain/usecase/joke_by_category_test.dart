import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_norris_jokes/features/domain/domain.dart';

class MockJokeByCategoryInterface extends Mock
    implements JokeByCategoryInterface {}

void main() {
  late JokeByCategoryUsecase usecase;
  late MockJokeByCategoryInterface mockJokeByCategoryInterface;

  setUp(() {
    mockJokeByCategoryInterface = MockJokeByCategoryInterface();
    usecase = JokeByCategoryUsecase(mockJokeByCategoryInterface);
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

  const category = 'Food';

  test(
    'Should get a joke by Category from the [JokeByCategoryInterface]',
    () async {
      when(() => mockJokeByCategoryInterface.getJokeByCategory(category))
          .thenAnswer((_) async => const Right(jokeRandom));

      final result = await usecase.getJokeByCategory(category);

      expect(result, const Right(jokeRandom));

      verify(() => mockJokeByCategoryInterface.getJokeByCategory(category));
      verifyNoMoreInteractions(mockJokeByCategoryInterface);
    },
  );
}
