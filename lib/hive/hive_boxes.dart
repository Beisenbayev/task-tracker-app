import 'package:hive/hive.dart';
import 'package:to_do_app/hive/entity/category.dart';
import 'entity/task.dart';

class HiveBoxAlias {
  static String categories = 'categories_box';
  static String archives = 'archives_box';
  static String tasks = 'tasks_box';
}

class HiveBoxes {
  static Box<Category> getCategoriesBox() =>
      Hive.box<Category>(HiveBoxAlias.categories);
  static Box<Task> getTasksBox() => Hive.box<Task>(HiveBoxAlias.tasks);
  static Box<Task> getArchivesBox() => Hive.box<Task>(HiveBoxAlias.archives);
}
