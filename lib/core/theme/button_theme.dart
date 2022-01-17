import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class ButtonThemeShelf {
  static ButtonStyle primaryButton(double vertical, double horizontal) =>
      ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorThemeShelf.primaryDark),
        foregroundColor:
            MaterialStateProperty.all(ColorThemeShelf.primaryLight),
        textStyle: MaterialStateProperty.all(TextThemeShelf.button),
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

  static ButtonStyle disabledButton(double vertical, double horizontal) =>
      ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(ColorThemeShelf.unselectedBackground),
        foregroundColor:
            MaterialStateProperty.all(ColorThemeShelf.primaryLight),
        textStyle: MaterialStateProperty.all(TextThemeShelf.button),
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
