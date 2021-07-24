import 'package:equatable/equatable.dart';
import 'package:rick_morty_and_flutter/modules/character/shared/enums/character_status.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String image;
  final String species;
  final CharacterStatus status;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.species,
    required this.status,
  });

  List<Object> get props => [id, name, image, species, status];
}
