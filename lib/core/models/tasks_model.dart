import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class TasksModel extends ChangeNotifier {
  List<Task> _tasks = [];

  TasksModel() {
    _setup();
  }

  void _setup() {
    final tasksBox = HiveBoxes.getTasksBox();
    _notifyListenChange(tasksBox);
    tasksBox.listenable().addListener(() => _notifyListenChange(tasksBox));
  }

  void _notifyListenChange(Box<Task> box) {
    _tasks = box.values.toList();
    notifyListeners();
  }

  List<Task> get tasks => _tasks;
}

class TasksModelProvider extends InheritedNotifier {
  final TasksModel model;

  const TasksModelProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static TasksModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TasksModelProvider>();
  }

  @override
  bool updateShouldNotify(TasksModelProvider oldWidget) {
    return true;
  }
}
