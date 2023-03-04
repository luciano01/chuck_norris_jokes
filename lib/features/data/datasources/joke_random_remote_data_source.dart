import 'package:chuck_norris_jokes/features/data/data.dart';

abstract class JokeRandomRemoteDataSource {
  Future<JokeModel> getJokeRandom();
}
