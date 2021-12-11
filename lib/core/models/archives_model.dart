import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class ArchivesModel extends ChangeNotifier {
  final _archivesBox = HiveBoxes.getArchivesBox();
  List<Task> archives = [];

  ArchivesModel() {
    _setup();
  }

  void _setup() {
    archives = _archivesBox.values.toList();
    _archivesBox
        .listenable()
        .addListener(() => _notifyListenChange(_archivesBox));
  }

  void _notifyListenChange(Box<Task> box) {
    archives = box.values.toList();
    notifyListeners();
  }

  void removeTask(int index) {
    _archivesBox.deleteAt(index);
  }

  void unarchiveTask(int index) {
    final tasksBox = HiveBoxes.getTasksBox();
    final taskKey = _archivesBox.keyAt(index);
    final task = _archivesBox.get(taskKey);
    _archivesBox.delete(taskKey);

    if (task != null) {
      tasksBox.add(task);
    }
  }
}

class ArchivesModelProvider extends InheritedNotifier {
  final ArchivesModel model;

  const ArchivesModelProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static ArchivesModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ArchivesModelProvider>();
  }

  @override
  bool updateShouldNotify(ArchivesModelProvider oldWidget) {
    return true;
  }
}
