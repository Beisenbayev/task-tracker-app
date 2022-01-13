import 'package:flutter/cupertino.dart';

class TaskModel extends ChangeNotifier {
  final int? _taskIndex;
  String taskTitle = '';
  String taskDescribtion = '';

  TaskModel(this._taskIndex);
}

class TaskModelProvider extends InheritedNotifier {
  final TaskModel model;

  const TaskModelProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static TaskModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskModelProvider>();
  }

  @override
  bool updateShouldNotify(TaskModelProvider oldWidget) {
    return true;
  }
}
