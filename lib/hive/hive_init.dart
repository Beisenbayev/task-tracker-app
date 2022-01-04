import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/category.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

void initHiveAdapters() {
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(CategoryAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TaskAdapter());
  }
}

Future<void> initHiveBoxes() async {
  await Hive.openBox<Task>(HiveBoxAlias.categories);
  await Hive.openBox<Task>(HiveBoxAlias.archives);
}

Future<void> deleteHiveData() async {
  await Hive.close();
  await Hive.deleteFromDisk();
}
