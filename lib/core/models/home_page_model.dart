import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/category.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class HomePageModel extends ChangeNotifier {
  int _categoryIndex = 0;
  late int _categoryKey;
  final Box<Category> _categoriesBox = HiveBoxes.getCategoriesBox();
  late Box<Task> _tasksBox;
  List<Category> _categories = [];
  List<Task> _tasks = [];

  int get categoryIndex => _categoryIndex;
  List<Category> get categories => _categories;
  List<Task> get tasks => _tasks;

  HomePageModel() {
    _setup();
  }

  void _setup() {
    _notifyCategoriesChange();
    _categoriesBox.listenable().addListener(_notifyCategoriesChange);
  }

  void _notifyCategoriesChange() {
    _categories = _categoriesBox.values.toList();
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
