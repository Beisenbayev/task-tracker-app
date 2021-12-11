import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskListItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final Function handleRemove;
  final Function handleEdit;
  final Function handleArchive;

  const TaskListItemWidget({
    Key? key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.handleRemove,
    required this.handleEdit,
    required this.handleArchive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {
          print('tap');
        },
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
