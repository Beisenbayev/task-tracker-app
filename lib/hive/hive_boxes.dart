import 'package:hive/hive.dart';
import 'package:to_do_app/hive/entity/category.dart';
import 'entity/task.dart';

class HiveBoxAlias {
  static String categories = 'categories_box';
  static String archives = 'archives_box';
  static String tasks(id) => 'tasks_box_$id';
}

class HiveBoxes {
  static Box<Category> getCategoriesBox() =>
      Hive.box<Category>(HiveBoxAlias.categories);
  static Box<Task> getTasksBox(id) => Hive.box<Task>(HiveBoxAlias.tasks(id));
  static Box<Task> getArchivesBox() => Hive.box<Task>(HiveBoxAlias.archives);
}
