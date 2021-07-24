import 'package:flutter/material.dart';
import 'package:rick_morty_and_flutter/core/colors/app_colors.dart';

class AppThemes {
  static final primary = ThemeData(
    primaryColor: AppColors.primary,
    accentColor: AppColors.accent,
    cardTheme: CardTheme(
      color: AppColors.card,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(color: AppColors.text),
      headline2: TextStyle(color: AppColors.text),
      headline3: TextStyle(color: AppColors.text),
      headline4: TextStyle(color: AppColors.text),
      headline5: TextStyle(color: AppColors.text, fontSize: 22),
      headline6: TextStyle(color: AppColors.text, fontSize: 18),
      subtitle1: TextStyle(color: AppColors.text),
      subtitle2: TextStyle(color: AppColors.text),
      bodyText1: TextStyle(color: AppColors.text),
      bodyText2: TextStyle(color: AppColors.text),
      button: TextStyle(color: AppColors.text),
      caption: TextStyle(color: AppColors.text),
      overline: TextStyle(color: AppColors.text),
    ),
  );
}
