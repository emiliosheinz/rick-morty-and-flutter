import 'package:equatable/equatable.dart';
import 'package:rick_morty_and_flutter/modules/character/shared/enums/character_status.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String image;
  final String species;
  final CharacterStatus status;
  final String? gender;
  final String? origin;
  final String? location;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.species,
    required this.status,
    this.gender,
    this.origin,
    this.location,
  });

  List<Object?> get props => [
        id,
        name,
        image,
        species,
        status,
        gender,
        origin,
        location,
      ];
}
