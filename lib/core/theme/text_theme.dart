import 'package:flutter/cupertino.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';

class TextThemeBox {
  static TextStyle title(double fontSize, [Color? color]) => TextStyle(
    fontFamily: 'Helvetica',
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: color ?? ColorsTheme.primaryDark,
  );

  static TextStyle lightTitle(double fontSize, [Color? color]) => TextStyle(
    fontFamily: 'Helvetica',
    fontSize: fontSize,
    fontWeight: FontWeight.normal,
    height: 1.2,
    color: color ?? ColorsTheme.primaryDark,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    height: 1.2,
    color: ColorsTheme.subtitleColor,
  );

  static const TextStyle button = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: ColorsTheme.primaryLight,
  );
}
