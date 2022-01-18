import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/core/theme/colors_theme.dart';
import 'package:to_do_app/core/theme/text_theme.dart';

class ArchiveItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDone;
  final bool isMarked;
  final void Function() unarchiveTask;
  final void Function() deleteTask;

  const ArchiveItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.isDone,
    required this.isMarked,
    required this.unarchiveTask,
    required this.deleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: ColorThemeShelf.primaryBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.03),
            spreadRadius: 0,
            blurRadius: 17,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Slidable(
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
              _ArchiveItemWidgetMark(
                isDone: isDone,
                isMarked: isMarked,
              ),
            ],
          ),
        ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) => unarchiveTask(),
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              icon: Icons.unarchive,
              label: 'Unarchive',
            ),
            SlidableAction(
              onPressed: (BuildContext context) => deleteTask(),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}

class _ArchiveItemWidgetMark extends StatelessWidget {
  final bool isDone;
  final bool isMarked;

  const _ArchiveItemWidgetMark({
    required this.isDone,
    required this.isMarked,
  });

  @override
  Widget build(BuildContext context) {
    final markWidget = isMarked
        ? Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF387),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.star_rounded,
              size: 18,
              color: Colors.white,
            ),
          )
        : const SizedBox.shrink();

    final Color selectColor = isDone
        ? ColorThemeShelf.selectedBackground
        : ColorThemeShelf.unselectedBackground;

    final Widget selectIcon = isDone
        ? const Icon(
            Icons.done,
            size: 18,
            color: ColorThemeShelf.selectedForeground,
          )
        : const SizedBox.shrink();

    return Row(
      children: [
        markWidget,
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: selectColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: selectIcon,
        ),
      ],
    );
  }
}
