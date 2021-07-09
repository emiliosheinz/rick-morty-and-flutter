import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final properties;

  Failure([List this.properties = const <dynamic>[]]);

  List<Object?> get props => properties;
}

class ServerFailure extends Failure {}
