import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';

class CustomRoundedButton extends StatelessWidget {
  final double diameter;
  final Color background;
  final Color foreground;
  final IconData icon;
  final void Function()? onTap;

  const CustomRoundedButton({
    Key? key,
    this.diameter = 50,
    this.background = ColorThemeShelf.primaryDark,
    this.foreground = ColorThemeShelf.primaryLight,
    this.icon = Icons.add,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(100),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Center(
            child: Icon(
              icon,
              color: foreground,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
