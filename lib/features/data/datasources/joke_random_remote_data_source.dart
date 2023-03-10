import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:chuck_norris_jokes/features/data/data.dart';

import '../../../core/core.dart';

abstract class JokeRandomRemoteDataSource {
  Future<JokeModel> getJokeRandom();
}

class JokeRandomRemoteDataSourceImpl implements JokeRandomRemoteDataSource {
  final http.Client client;

  JokeRandomRemoteDataSourceImpl(this.client);

  @override
  Future<JokeModel> getJokeRandom() async {
    final response = await client.get(
      Uri.parse('https://api.chucknorris.io/jokes/random'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return JokeModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
