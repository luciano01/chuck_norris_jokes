import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_norris_jokes/core/core.dart';

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImp networkInfoImp;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfoImp = NetworkInfoImp(mockInternetConnectionChecker);
  });

  test('Check if has internet connection', () async {
    when(() => mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) async => true);

    final result = await networkInfoImp.hasConnection;

    expect(result, true);
    verify(() => mockInternetConnectionChecker.hasConnection);
  });
}
