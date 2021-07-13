part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  final List properties;

  const CharacterState([this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => [properties];
}

class Empty extends CharacterState {}

class Loading extends CharacterState {}

class Loaded extends CharacterState {
  final List<Character> characters;

  Loaded({required this.characters}) : super([characters]);
}

class Error extends CharacterState {
  final String message;

  Error({required this.message}) : super([message]);
}
