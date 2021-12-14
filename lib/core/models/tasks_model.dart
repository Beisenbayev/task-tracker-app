import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';
import 'package:to_do_app/router/routes.dart';

class TasksModel extends ChangeNotifier {
  final _tasksBox = HiveBoxes.getTasksBox();
  List<Task> _tasks = [];

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

  void openCreateTaskPage(BuildContext context) {
    Navigator.of(context).pushNamed(RouteAliasData.createTask);
  }

  void openEditTaskPage(BuildContext context, int index) {
    final taskKey = _tasksBox.keyAt(index);
    Navigator.of(context)
        .pushNamed(RouteAliasData.editTask, arguments: taskKey);
  }

  void removeTask(int index) {
    _tasksBox.deleteAt(index);
  }

  void archiveTask(int index) {
    final archivesBox = HiveBoxes.getArchivesBox();
    final task = _tasksBox.getAt(index);
    _tasksBox.deleteAt(index);

    if (task != null) {
      archivesBox.add(task);
    }
  }

  void changeTaskState(int index) {
    final task = _tasksBox.getAt(index);
    task?.isDone = !task.isDone;
    task?.save();
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
