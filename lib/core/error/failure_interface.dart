import 'package:equatable/equatable.dart';

abstract class FailureInterface extends Equatable {
  const FailureInterface([List properties = const <dynamic>[]]);
}

class ServerFailure extends FailureInterface {
  @override
  List<Object?> get props => throw UnimplementedError();
}
