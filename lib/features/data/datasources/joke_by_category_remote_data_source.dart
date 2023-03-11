import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:chuck_norris_jokes/features/data/data.dart';
import '../../../core/core.dart';

abstract class JokeByCategoryRemoteDataSource {
  Future<JokeModel> getJokeByCategory(String category);
}

class JokeByCategoryRemoteDataSourceImpl
    implements JokeByCategoryRemoteDataSource {
  final http.Client client;

  JokeByCategoryRemoteDataSourceImpl(this.client);

  @override
  Future<JokeModel> getJokeByCategory(String category) async {
    final response = await client.get(
      Uri.parse('https://api.chucknorris.io/jokes/random?category=$category'),
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
