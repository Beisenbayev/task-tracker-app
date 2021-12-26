import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class CategoryItemWidget extends StatelessWidget {
  final Color color;
  final Color activeColor;
  final IconData icon;
  final String title;
  final int taskCount;

  const CategoryItemWidget({
    Key? key,
    required this.color,
    required this.activeColor,
    required this.icon,
    required this.title,
    required this.taskCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 136,
      padding: const EdgeInsets.fromLTRB(9, 11, 9, 18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(23),
          topRight: Radius.circular(63),
          bottomLeft: Radius.circular(23),
          bottomRight: Radius.circular(23),
        ),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CategoryItemIconWidget(color: activeColor, icon: icon),
          _CategoryItemInfoWidget(title: title, taskCount: taskCount)
        ],
      ),
    );
  }
}

class _CategoryItemIconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _CategoryItemIconWidget({
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51,
      height: 51,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1),
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Center(
        child: Icon(
          icon,
          size: 19,
          color: color,
        ),
      ),
    );
  }
}

class _CategoryItemInfoWidget extends StatelessWidget {
  final String title;
  final int taskCount;

  const _CategoryItemInfoWidget({
    required this.title,
    required this.taskCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextThemeBox.title),
        const SizedBox(height: 5),
        Text('+$taskCount task', style: TextThemeBox.subtitle),
      ],
    );
  }
}
