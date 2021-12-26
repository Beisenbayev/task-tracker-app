import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class ButtonThemeBox {
  static ButtonStyle primaryButton(double vertical, double horizontal) =>
      ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsTheme.primaryDark),
        foregroundColor: MaterialStateProperty.all(ColorsTheme.primaryLight),
        textStyle: MaterialStateProperty.all(TextThemeBox.button),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: vertical,
            horizontal: horizontal,
          ),
        ),
      );
}
