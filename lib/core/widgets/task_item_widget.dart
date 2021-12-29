import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class TaskItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;

  const TaskItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 28),
      decoration: BoxDecoration(
          color: ColorsTheme.primaryBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.03),
              spreadRadius: 0,
              blurRadius: 17,
              offset: Offset(0, 4),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: ColorsTheme.primaryDark),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              title,
              style: TextThemeBox.lightTitle(16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 18),
          _TaskItemWidgetMark(isSelected: isSelected),
        ],
      ),
    );
  }
}

class _TaskItemWidgetMark extends StatelessWidget {
  final bool isSelected;

  const _TaskItemWidgetMark({
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected
        ? ColorsTheme.selectedBackground
        : ColorsTheme.unselectedBackground;

    final Widget selectIcon = isSelected
        ? const Icon(
            Icons.done,
            size: 12,
            color: ColorsTheme.selectedForeground,
          )
        : const SizedBox.shrink();

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: selectIcon,
    );
  }
}
