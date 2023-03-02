import 'dart:convert';

import 'package:chuck_norris_jokes/features/data/models/models.dart';
import 'package:chuck_norris_jokes/features/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const jokeModel = JokeModel(
    categories: ['food'],
    createdAt: '',
    iconUrl: '',
    id: '',
    updatedAt: '',
    url: '',
    value: 'Chuck Norris makes onions cry.',
  );

  test('Should be a subclass of JokeEntity', () async {
    expect(jokeModel, isA<JokeEntity>());
  });

  test('Should return a valid model from JSON', () async {
    final Map<String, dynamic> jsonResponse =
        json.decode(fixture('joke_response.json'));

    final result = JokeModel.fromJson(jsonResponse);

    expect(result, jokeModel);
  });

  test('Should return JSON map containing the Joke data', () async {
    final result = jokeModel.toJson();

    final expectedJsonMap = {
      "categories": ["food"],
      "created_at": "",
      "icon_url": "",
      "id": "",
      "updated_at": "",
      "url": "",
      "value": "Chuck Norris makes onions cry."
    };

    expect(result, expectedJsonMap);
  });
}
