import 'package:flutter/material.dart';
import 'colors.dart';

export 'colors.dart';
export 'themes.dart';

abstract class SkalerStyles{
  static const TextStyle defaultTextStyle = TextStyle(
    color: SkalerColors.textDark,
    letterSpacing: 4,
    fontSize: 25,
    fontFamily: "Century Gothic",
  );

  static const TextStyle highlightTextStyle = TextStyle(
    color: SkalerColors.accentColor,
    letterSpacing: 4,
    fontSize: 25,
    fontFamily: "Century Gothic",
    
  );

  static const TextStyle lightTextStyle = TextStyle(
    color: SkalerColors.textLight,
    letterSpacing: 4,
    fontSize: 25,
    fontFamily: "Century Gothic",
  );
}