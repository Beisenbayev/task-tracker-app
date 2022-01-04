import 'package:flutter/cupertino.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';

class TextThemeShelf {
  static TextStyle title(double fontSize, [Color? color]) => TextStyle(
        fontFamily: 'Helvetica',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: color ?? ColorThemeShelf.primaryDark,
      );

  static TextStyle lightTitle(double fontSize, [Color? color]) => TextStyle(
        fontFamily: 'Helvetica',
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        height: 1.2,
        color: color ?? ColorThemeShelf.primaryDark,
      );

  static TextStyle subtitle(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        height: 1.2,
        color: ColorThemeShelf.subtitleColor,
      );

  static const TextStyle text = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.2,
    color: ColorThemeShelf.primaryDark,
  );

  static const TextStyle button = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: ColorThemeShelf.primaryLight,
  );
}
