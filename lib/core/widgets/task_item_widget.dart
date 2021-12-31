import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class TaskItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final bool isMarked;

  const TaskItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.isMarked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
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
      ),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: isMarked ? Icons.bookmark_remove : Icons.bookmark_add,
            label: isMarked ? 'Unmark' : 'Mark',
          ),
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.note_alt,
            label: 'Edit',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
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
