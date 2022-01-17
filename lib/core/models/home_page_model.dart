import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/category.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class HomePageModel extends ChangeNotifier {
  int _categoryIndex = 0;
  late int _categoryKey;
  final Box<Category> _categoriesBox = HiveBoxes.getCategoriesBox();
  final Box<Task> _archivesBox = HiveBoxes.getArchivesBox();
  late Box<Task> _tasksBox;
  List<Category> _categories = [];
  List<Task> _tasks = [];
  bool _isTasksAvailable = false;

  int get categoryIndex => _categoryIndex;
  List<Category> get categories => _categories;
  List<Task> get tasks => _tasks;
  bool get isTasksAvailable => _isTasksAvailable;

  HomePageModel() {
    _setup();
  }

  void _setup() {
    _notifyCategoriesChange();
    _categoriesBox.listenable().addListener(_notifyCategoriesChange);
  }

  void _notifyCategoriesChange() {
    _categories = _categoriesBox.values.toList();
    _isTasksAvailable = (_categories.isEmpty) ? false : true;
    notifyListeners();
  }

  void _notifyTasksChange() {
    _tasks = _tasksBox.values.toList();
    notifyListeners();
  }

  void _initTasksByKey() async {
    _categoryKey = _categoriesBox.keyAt(_categoryIndex);
    _tasksBox = await HiveBoxes.getTasksBox(_categoryKey);
    _tasksBox.listenable().addListener(_notifyTasksChange);
    _tasks = _tasksBox.values.toList();
  }

  void changeCategoryIndex(int index) {
    _categoryIndex = index;
    _initTasksByKey();
    notifyListeners();
  }

  void toggleTaskIsDone(int index) async {
    final task = _tasksBox.getAt(index);
    task!.isDone = !task.isDone;
    await _tasksBox.putAt(index, task);
    notifyListeners();
  }

  void toggleTaskIsMarked(int index) async {
    final task = _tasksBox.getAt(index);
    task!.isMarked = !task.isMarked;
    await _tasksBox.putAt(index, task);
    notifyListeners();
  }

  void handleArchiveTask(int index) async {
    final task = _tasksBox.getAt(index);
    await _tasksBox.deleteAt(index);
    await _archivesBox.add(task!);
    notifyListeners();
  }

  void handleDeleteTask(int index) async {
    await _tasksBox.deleteAt(index);
    notifyListeners();
  }
}

class HomePageProvider extends InheritedNotifier {
  final HomePageModel model;

  const HomePageProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static HomePageProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomePageProvider>();
  }

  @override
  bool updateShouldNotify(HomePageProvider oldWidget) {
    return true;
  }
}
