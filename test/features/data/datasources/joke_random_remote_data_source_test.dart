import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'package:chuck_norris_jokes/features/data/data.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late JokeRandomRemoteDataSourceImpl dataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSourceImpl = JokeRandomRemoteDataSourceImpl(
      mockHttpClient,
    );
  });

  test(
    'Should preform a GET request on a URL with application/json header',
    () async {
      when(() => mockHttpClient.get(
                Uri.parse('https://api.chucknorris.io/jokes/random'),
                headers: any(named: 'headers'),
              ))
          .thenAnswer((_) async =>
              http.Response(fixture('json_response_with_data.json'), 200));

      dataSourceImpl.getJokeRandom();

      verify(() => mockHttpClient.get(
            Uri.parse('https://api.chucknorris.io/jokes/random'),
            headers: {
              'Content-Type': 'application/json',
            },
          ));
    },
  );
}
