import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/hive/entity/group.dart';
import 'package:to_do_app/hive/entity/task.dart';

class GroupFormModel {
  String title = '';

  Future<void> saveGroup(BuildContext context) async {
    if (title.isEmpty) return;

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(TaskAdapter());
    }
    
    final box = await Hive.openBox<Group>('groups_box');
    final tasksBox = await Hive.openBox<Task>('tasks_box');
    final group = Group(name: title, tasks: HiveList(tasksBox));
    await box.add(group);
    Navigator.of(context).pop();
  }
}

class GroupFormModelProvider extends InheritedWidget {
  final GroupFormModel model;

  const GroupFormModelProvider({
    Key? key,
    required this.model,
    required child,
  }) : super(key: key, child: child);

  static GroupFormModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupFormModelProvider>();
  }

  @override
  bool updateShouldNotify(GroupFormModelProvider oldWidget) {
    return true;
  }
}
