import 'package:rick_morty_and_flutter/core/utils/enum.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/shared/enums/character_status.dart';

CharacterStatus _getStatusFromString(String statusFromJson) {
  return EnumUtils.fromString(
    CharacterStatus.values,
    statusFromJson.toString().toLowerCase(),
  );
}

class CharacterModel extends Character {
  final int id;
  final String name;
  final String image;
  final CharacterStatus status;

  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
  }) : super(
          id: id,
          name: name,
          image: image,
          status: status,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: _getStatusFromString(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "status": status.name,
    };
  }
}
