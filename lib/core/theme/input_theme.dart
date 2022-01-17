import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';

class InputThemeShelf {
  static InputDecoration outlineInput(String? label) => InputDecoration(
        filled: true,
        fillColor: ColorThemeShelf.primaryBackground,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        label: Text(label ?? ''),
        alignLabelWithHint: true,
      );
}
