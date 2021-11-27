import 'package:flutter/material.dart';

class GroupListItemWidget extends StatelessWidget {
  final String title;

  const GroupListItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {},
    );
  }
}
