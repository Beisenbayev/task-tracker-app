import 'package:flutter/cupertino.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';

class TextThemeBox {
  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: ColorsTheme.primaryDark,
  );

  static const TextStyle button = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: ColorsTheme.primaryLight,
  );
}
