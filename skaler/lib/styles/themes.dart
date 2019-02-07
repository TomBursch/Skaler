import 'package:flutter/material.dart';
import 'styles.dart';


abstract class SkalerThemes{
  static ThemeData appTheme = ThemeData(
    primaryColor: SkalerColors.primaryColor,
    accentColor: SkalerColors.accentColor,
    backgroundColor: Colors.white,
    buttonTheme: defaultButtonTheme,
    iconTheme: defaultIconTheme,
    textTheme: defaultTextTheme,

    fontFamily: "Century Gothic"
  );

  static ButtonThemeData defaultButtonTheme = ButtonThemeData(
    buttonColor: SkalerColors.primaryLightColor,
    shape: Border.all(width: .3, color: Colors.grey),
  );
  static ButtonThemeData operationButtonTheme = ButtonThemeData(
    buttonColor: SkalerColors.primaryColor,
    shape: Border.all(width: .3, color: Colors.grey),
  );

  static IconThemeData defaultIconTheme = IconThemeData(
    color: SkalerColors.textLight,
  );

  static TextTheme defaultTextTheme = TextTheme(
    body1: SkalerStyles.defaultTextStyle,
  );
}