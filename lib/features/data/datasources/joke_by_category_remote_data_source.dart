import 'package:chuck_norris_jokes/features/data/data.dart';

abstract class JokeByCategoryRemoteDataSource {
  Future<JokeModel> getJokeByCategory(String category);
}
