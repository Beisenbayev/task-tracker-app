import 'package:hive/hive.dart';
import 'entity/task.dart';

class HiveBoxAlias {
  static String categories = 'categories_box';
  static String archives = 'archives_box';
  static String tasks = 'tasks_box';
}

class HiveBoxes {
  static Box<Task> getCategoriesBox() =>
      Hive.box<Task>(HiveBoxAlias.categories);
  static Box<Task> getTasksBox() => Hive.box<Task>(HiveBoxAlias.tasks);
  static Box<Task> getArchivesBox() => Hive.box<Task>(HiveBoxAlias.archives);
}
