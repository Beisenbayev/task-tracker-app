import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ArchiveListItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final Function handleRemove;
  final Function handleUnarchive;

  const ArchiveListItemWidget({
    Key? key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.handleRemove,
    required this.handleUnarchive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      child: Slidable(
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.grey, width: 10),
            ),
          ),
          child: ListTile(
            title: Text(title),
            subtitle: Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) => handleUnarchive(index),
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.unarchive,
              label: 'Unarchive',
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
      ),
    );
  }
}
