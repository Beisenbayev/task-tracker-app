import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/task.dart';

void initHiveAdapters() {
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(TaskAdapter());
  }
}

Future<void> initHiveBoxes() async {
  await Hive.openBox<Task>('tasks_box');
}
