import 'package:flutter/material.dart';
import 'colors.dart';

export 'colors.dart';
export 'themes.dart';

abstract class SkalerStyles{
  static const TextStyle defaultTextStyle = TextStyle(
    color: SkalerColors.textDefault,
    fontSize: 25,
    fontFamily: "Century Gothic",
  );

  static const TextStyle highlightTextStyle = TextStyle(
    color: SkalerColors.accentColor,
    fontSize: 45,
    fontFamily: "Century Gothic",
  );

  static const TextStyle lightTextStyle = TextStyle(
    color: SkalerColors.textLight,
    fontSize: 25,
    fontFamily: "Century Gothic",
  );
}