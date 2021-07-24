import 'package:flutter/material.dart';
import 'package:rick_morty_and_flutter/core/colors/app_colors.dart';

enum CharacterStatus { alive, dead, unknow }

extension CharacterStatusExtension on CharacterStatus {
  static final _colors = {
    CharacterStatus.alive: AppColors.aliveCharacter,
    CharacterStatus.dead: AppColors.deadCharacter,
    CharacterStatus.unknow: AppColors.unknowCharacter,
  };

  static final _names = {
    CharacterStatus.alive: 'Alive',
    CharacterStatus.dead: 'Dead',
    CharacterStatus.unknow: 'Unknow',
  };

  Color get color => _colors[this] ?? _colors[CharacterStatus.unknow]!;

  String get name => _names[this] ?? _names[CharacterStatus.unknow]!;
}
