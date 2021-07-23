import 'package:flutter/material.dart';

enum CharacterStatus { alive, dead, unknow }

extension CharacterStatusExtension on CharacterStatus {
  // TODO emilioheinz: use themed colors
  static const _colors = {
    CharacterStatus.alive: Colors.green,
    CharacterStatus.dead: Colors.red,
    CharacterStatus.unknow: Colors.grey,
  };

  static const _names = {
    CharacterStatus.alive: 'Alive',
    CharacterStatus.dead: 'Dead',
    CharacterStatus.unknow: 'Unknow',
  };

  Color get color => _colors[this] ?? _colors[CharacterStatus.unknow]!;

  String get name => _names[this] ?? _names[CharacterStatus.unknow]!;
}
