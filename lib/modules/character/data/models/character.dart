import 'package:rick_morty_and_flutter/core/utils/enum.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/shared/enums/character_status.dart';

CharacterStatus _getStatusFromString(String statusFromJson) {
  final parsedStatus = EnumUtils.fromString(
    CharacterStatus.values,
    statusFromJson.toString().toLowerCase(),
  );

  return parsedStatus ?? CharacterStatus.unknow;
}

class CharacterModel extends Character {
  final int id;
  final String name;
  final String image;
  final String species;
  final CharacterStatus status;
  final String? gender;
  final String? origin;
  final String? location;

  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
    required this.species,
    required this.status,
    this.gender,
    this.origin,
    this.location,
  }) : super(
          id: id,
          name: name,
          image: image,
          species: species,
          status: status,
          gender: gender,
          origin: origin,
          location: location,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      species: json['species'],
      status: _getStatusFromString(json['status']),
    );
  }

  factory CharacterModel.detailedFromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      species: json['species'],
      status: _getStatusFromString(json['status']),
      gender: json['gender'],
      origin: json['origin']['name'],
      location: json['location']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "species": species,
      "status": status.name,
      "gender": gender,
      "origin": origin,
      "location": location
    };
  }
}
