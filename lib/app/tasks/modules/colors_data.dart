import 'package:flutter/material.dart';

class ColorData {
  final int id;
  final Color color;

  ColorData({
    required this.id,
    required this.color,
  });
}

class ColorsCollection {
  static final List<ColorData> colors = [
    ColorData(id: 1, color: Colors.grey),
    ColorData(id: 2, color: const Color(0xFF4f81bc)),
    ColorData(id: 3, color: const Color(0xFF8064a1)),
    ColorData(id: 4, color: const Color(0xFFfea500)),
    ColorData(id: 5, color: const Color(0xFFfe0000)),
  ];
}