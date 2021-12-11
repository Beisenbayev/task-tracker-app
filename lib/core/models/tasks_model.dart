import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

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
    Navigator.of(context).pushNamed('/tasks/form');
  }

  void openEditTaskPage(BuildContext context, int index) {
    final taskKey = _tasksBox.keyAt(index);
    Navigator.of(context).pushNamed('/tasks/edit-task', arguments: taskKey);
  }

  void removeTask(int index) {
    _tasksBox.deleteAt(index);
  }

  void archiveTask(int index) {
    final archivesBox = HiveBoxes.getArchivesBox();
    final taskKey = _tasksBox.keyAt(index);
    final task = _tasksBox.get(taskKey);
    _tasksBox.delete(taskKey);

    if (task != null) {
      archivesBox.add(task);
    }
  }

  void changeTaskState(int index) {
    final taskKey = _tasksBox.keyAt(index);
    final task = _tasksBox.get(taskKey);

    if (task != null) {
      task.isDone = !task.isDone;
      _tasksBox.put(taskKey, task);
    }
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
