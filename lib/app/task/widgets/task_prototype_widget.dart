import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/padding_consts.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class TaskPrototypeWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String describtion;
  final bool isDone;

  const TaskPrototypeWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.describtion,
    required this.isDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingConsts.horizontal,
      ),
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: ColorThemeShelf.primaryBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 24, color: ColorThemeShelf.primaryDark),
              const SizedBox(width: 18),
              Expanded(
                child: Text(
                  title,
                  style: TextThemeShelf.lightTitle(16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 18),
              _TaskItemWidgetMark(isDone: isDone),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskItemWidgetMark extends StatelessWidget {
  final bool isDone;

  const _TaskItemWidgetMark({
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isDone
        ? ColorThemeShelf.selectedBackground
        : ColorThemeShelf.unselectedBackground;

    final Widget selectIcon = isDone
        ? const Icon(
            Icons.done,
            size: 12,
            color: ColorThemeShelf.selectedForeground,
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
