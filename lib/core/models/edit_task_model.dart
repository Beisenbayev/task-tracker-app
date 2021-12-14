import 'package:flutter/material.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class EditTaskModel {
  final int _taskKey;
  final _tasksBox = HiveBoxes.getTasksBox();
  late Task task;

  EditTaskModel(this._taskKey) {
    task = _tasksBox.get(_taskKey)!;
  }

  void saveTaskChanges(BuildContext context) async {
    task.save();
    Navigator.of(context).pop();
  }
}

class EditTaskModelProvider extends InheritedWidget {
  final EditTaskModel model;

  const EditTaskModelProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child);

  static EditTaskModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EditTaskModelProvider>();
  }

  @override
  bool updateShouldNotify(EditTaskModelProvider oldWidget) {
    return false;
  }
}
