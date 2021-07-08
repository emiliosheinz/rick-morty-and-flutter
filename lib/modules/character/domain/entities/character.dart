import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String image;

  Character({required this.id, required this.name, required this.image});

  List<Object> get props => [id, name, image];
}
