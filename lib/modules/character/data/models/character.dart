import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';

class CharacterModel extends Character {
  final int id;
  final String name;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
  }) : super(id: id, name: name, image: image);

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
