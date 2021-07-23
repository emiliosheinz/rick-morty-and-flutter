import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:rick_morty_and_flutter/modules/character/shared/enums/character_status.dart';

void main() {
  group('CharacterStatusExtension', () {
    test("Color getter should always return a collor", () async {
      CharacterStatus.values.forEach((element) {
        expect(element.color, isA<Color>());
      });
    });

    test("Name getter should always return a String", () async {
      CharacterStatus.values.forEach((element) {
        expect(element.name, isA<String>());
      });
    });

    test(
        "Name getter should always return a String with the firts letter in uppercase",
        () async {
      CharacterStatus.values.forEach((element) {
        expect(element.name[0], element.name[0].toUpperCase());
      });
    });
  });
}
