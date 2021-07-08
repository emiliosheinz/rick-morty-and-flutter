import "package:flutter_test/flutter_test.dart";
import 'package:rick_morty_and_flutter/modules/character/data/models/character.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';

void main() {
  final characterModel = CharacterModel(
    id: 1,
    name: "Teste Name",
    image: "image.png",
  );

  test("should be a subclass of Character entity", () async {
    expect(characterModel, isA<Character>());
  });
}
