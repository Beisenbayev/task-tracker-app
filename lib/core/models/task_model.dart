import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/category.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class TaskIndexData {
  final int? taskIndex;
  final int categoryIndex;

  TaskIndexData({
    this.taskIndex,
    required this.categoryIndex,
  });
}

class TaskModel extends ChangeNotifier {
  final TaskIndexData _taskIndexData;
  late final int _categoryIndex;
  late final int? _taskIndex;
  final Box<Category> _categoriesBox = HiveBoxes.getCategoriesBox();
  late final Box<Task> _tasksBox;
  String title = 'Title';
  String describtion = '';
  bool isDone = false;
  bool isMarked = false;
  int iconId = 0;

  TaskModel(this._taskIndexData) {
    _setup();
  }

  void _setup() async {
    _categoryIndex = _taskIndexData.categoryIndex;
    _taskIndex = _taskIndexData.taskIndex;
    final _categoryKey = _categoriesBox.keyAt(_categoryIndex);
    _tasksBox = await HiveBoxes.getTasksBox(_categoryKey);
    final category = _categoriesBox.get(_categoryKey);
    iconId = category!.iconId;
    if (_taskIndex != null) {
      final task = _tasksBox.getAt(_taskIndex!);
      title = task!.title;
      describtion = task.describtion;
      isDone = task.isDone;
      isMarked = task.isMarked;
    }
  }

  void handleChangeTitle(String value) {
    title = value;
    notifyListeners();
  }

  void handleChangeDescribtion(String value) {
    describtion = value;
    notifyListeners();
  }

  void saveNewTask(BuildContext context) {
    if (title.isEmpty) return;

    final Task task = Task(
      title: title,
      describtion: describtion,
      iconId: iconId,
      isDone: isDone,
      isMarked: isMarked,
    );

    if (_taskIndex != null) {
      _tasksBox.put(_taskIndex, task);
    } else {
      _tasksBox.add(task);
    }

    Navigator.of(context).pop();
  }
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
