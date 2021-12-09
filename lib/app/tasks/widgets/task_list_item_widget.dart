import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskListItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final Function handleRemove;
  final Function handleEdit;

  const TaskListItemWidget({
    Key? key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.handleRemove,
    required this.handleEdit,
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
