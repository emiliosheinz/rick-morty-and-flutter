import 'package:equatable/equatable.dart';

class Home extends Equatable {
  final List<String> characters;

  Home({required this.characters});

  List<Object> get props => [characters];
}
