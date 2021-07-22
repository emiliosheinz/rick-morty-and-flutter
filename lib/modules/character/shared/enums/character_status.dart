import 'package:flutter/material.dart';

enum CharacterStatus { alive, dead, unknow }

extension CharacterStatusExtension on CharacterStatus {
  // TODO emilioheinz: use themed colors
  Color get color {
    switch (this) {
      case CharacterStatus.alive:
        return Colors.green;
      case CharacterStatus.dead:
        return Colors.red;
      case CharacterStatus.unknow:
      default:
        return Colors.grey;
    }
  }

  String get name {
    switch (this) {
      case CharacterStatus.alive:
        return "Alive";
      case CharacterStatus.dead:
        return "Dead";
      case CharacterStatus.unknow:
      default:
        return "Unknow";
    }
  }
}
