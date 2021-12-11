import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskListItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final bool isDone;
  final Function handleRemove;
  final Function handleEdit;
  final Function handleArchive;
  final Function handleChangeState;

  const TaskListItemWidget({
    Key? key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.isDone,
    required this.handleRemove,
    required this.handleEdit,
    required this.handleArchive,
    required this.handleChangeState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskIcon = isDone ? Icons.done_rounded : Icons.chevron_right_rounded;
    final taskTextStyle =
        isDone ? const TextStyle(decoration: TextDecoration.lineThrough) : null;

    return Slidable(
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
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (BuildContext context) => handleArchive(index),
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) => handleRemove(index),
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
