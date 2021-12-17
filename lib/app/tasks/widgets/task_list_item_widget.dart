import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskListItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final bool isDone;
  final bool isMarked;
  final Color color;
  final Function handleRemove;
  final Function handleEdit;
  final Function handleArchive;
  final Function handleChangeState;
  final Function handleMark;

  const TaskListItemWidget({
    Key? key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.isDone,
    required this.isMarked,
    required this.color,
    required this.handleRemove,
    required this.handleEdit,
    required this.handleArchive,
    required this.handleChangeState,
    required this.handleMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskIcon =
        isDone ? Icons.done_rounded : (isMarked ? Icons.bookmark : null);
    final taskTextStyle =
        isDone ? const TextStyle(decoration: TextDecoration.lineThrough) : null;

    return Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 10, color: color)),
          ),
          child: ListTile(
            title: Text(
              title,
              style: taskTextStyle,
            ),
            subtitle: Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(taskIcon),
            onTap: () => handleChangeState(index),
            onLongPress: () => handleEdit(index),
          ),
        ),
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) => handleMark(index),
              backgroundColor: const Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: isMarked ? Icons.bookmark_remove : Icons.bookmark_add,
              label: isMarked ? 'Unmark' : 'Mark',
            ),
            SlidableAction(
              onPressed: (BuildContext context) => handleEdit(index),
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
              onPressed: (BuildContext context) => handleArchive(index),
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              icon: Icons.archive,
              label: 'Archive',
            ),
            SlidableAction(
              onPressed: (BuildContext context) => handleRemove(index),
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
