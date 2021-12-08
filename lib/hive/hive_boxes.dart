import 'package:hive/hive.dart';
import 'entity/task.dart';

class HiveBoxes {
  static Box<Task> getTasksBox() => Hive.box<Task>('tasks_box');
}