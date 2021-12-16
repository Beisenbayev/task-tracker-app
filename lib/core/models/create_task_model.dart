import 'package:flutter/material.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class CreateTaskModel {
  String taskTitle = '';
  String taskDescription = '';
  Color taskColor = Colors.grey;

  void saveTask(BuildContext context) {
    if (taskTitle.isEmpty) return;

    final task = Task(
      title: taskTitle,
      text: taskDescription,
      color: taskColor,
    );
    final tasksBox = HiveBoxes.getTasksBox();
    tasksBox.add(task);

    Navigator.of(context).pop();
  }
}

class CreateTaskModelProvider extends InheritedWidget {
  final CreateTaskModel model;

  const CreateTaskModelProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child);

  static CreateTaskModelProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CreateTaskModelProvider>();
  }

  @override
  bool updateShouldNotify(CreateTaskModelProvider oldWidget) {
    return false;
  }
}
