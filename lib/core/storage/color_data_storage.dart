import 'package:flutter/material.dart';

class ColorData {
  final Color color;
  final Color activeColor;

  ColorData({
    required this.color,
    required this.activeColor,
  });
}

class ColorsCollection {
  static List<ColorData> colors = [
    ColorData( //GREEN
      color: const Color(0x1F52D22E),
      activeColor: const Color(0xFF52D22E),
    ),

    ColorData( //YELLOW
      color: const Color(0x1FFFF387),
      activeColor: const Color(0xFFFFF387),
    ),

    ColorData( //PERPLE
      color: const Color(0x1F6270F0),
      activeColor: const Color(0xFF6270F0),
    ),

    ColorData( //RED
      color: const Color(0x1FEA5455),
      activeColor: const Color(0xFFEA5455),
    ),

    ColorData( //ORANGE
      color: const Color(0x1FFF9F43),
      activeColor: const Color(0xFFFF9F43),
    ),

    ColorData( //BROWN
      color: const Color(0x1F9F7F3F),
      activeColor: const Color(0xFF9F7F3F),
    ),
  ];
}
