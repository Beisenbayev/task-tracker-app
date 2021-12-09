import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class TasksModel extends ChangeNotifier {
  List<Task> _tasks = [];
  final _tasksBox = HiveBoxes.getTasksBox();

  TasksModel() {
    _setup();
  }

  void _setup() {
    _notifyListenChange(_tasksBox);
    _tasksBox.listenable().addListener(() => _notifyListenChange(_tasksBox));
  }

  void _notifyListenChange(Box<Task> box) {
    _tasks = box.values.toList();
    notifyListeners();
  }

  void removeTask(int index) {
    _tasksBox.deleteAt(index);
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
