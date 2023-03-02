import 'package:chuck_norris_jokes/features/data/models/models.dart';
import 'package:chuck_norris_jokes/features/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const jokeModel = JokeModel(
    categories: [],
    createdAt: '',
    iconUrl: '',
    id: '',
    updatedAt: '',
    url: '',
    value: '',
  );

  test('Should be a subclass of JokeEntity', () async {
    expect(jokeModel, isA<JokeEntity>());
  });
}
