import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'package:chuck_norris_jokes/core/core.dart';
import 'package:chuck_norris_jokes/features/data/data.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late JokeByCategoryRemoteDataSourceImpl dataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSourceImpl = JokeByCategoryRemoteDataSourceImpl(
      mockHttpClient,
    );
  });

  const category = 'food';

  test(
    'Should preform a GET request on a URL with application/json header',
    () async {
      when(() => mockHttpClient.get(
                Uri.parse(
                    'https://api.chucknorris.io/jokes/random?category=$category'),
                headers: any(named: 'headers'),
              ))
          .thenAnswer((_) async =>
              http.Response(fixture('json_response_with_data.json'), 200));

      dataSourceImpl.getJokeByCategory(category);

      verify(() => mockHttpClient.get(
            Uri.parse(
                'https://api.chucknorris.io/jokes/random?category=$category'),
            headers: {
              'Content-Type': 'application/json',
            },
          ));
    },
  );

  test(
    'Should throw a ServerException when the response code is 404 or other',
    () {
      when(() => mockHttpClient.get(
                Uri.parse(
                    'https://api.chucknorris.io/jokes/random?category=$category'),
                headers: any(named: 'headers'),
              ))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));

      final result = dataSourceImpl.getJokeByCategory(category);

      expect(result, throwsA(const TypeMatcher<ServerException>()));
    },
  );
}
