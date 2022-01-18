import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/archive.dart';
import 'package:to_do_app/hive/entity/task.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class ArchiveModel extends ChangeNotifier {
  final Box<Archive> _archivesBox = HiveBoxes.getArchivesBox();
  List<Archive> _archives = [];

  List<Archive> get archives => _archives;

  ArchiveModel() {
    _setup();
  }

  void _setup() {
    _notifyArchivesChange();
    _archivesBox.listenable().addListener(_notifyArchivesChange);
  }

  void _notifyArchivesChange() {
    _archives = _archivesBox.values.toList();
    notifyListeners();
  }

  void clearArchivedTasks() async {
    final taskKeys = _archivesBox.keys.toList();
    for (var key in taskKeys) {
      await _archivesBox.delete(key);
    }
    notifyListeners();
  }

  void handleUnarchiveTask(int index) async {
    final archive = _archivesBox.getAt(index);
    final task = Task(
      title: archive!.title,
      describtion: archive.describtion,
      iconId: archive.iconId,
      isDone: archive.isDone,
      isMarked: archive.isMarked,
    );

    final _tasksBox = await HiveBoxes.getTasksBox(archive.categoryKey);

    await _archivesBox.deleteAt(index);
    await _tasksBox.put(archive.taskKey, task);
    notifyListeners();
  }

  void handleDeleteTask(int index) async {
    await _archivesBox.deleteAt(index);
    notifyListeners();
  }
}

class ArchiveModelProvider extends InheritedWidget {
  final ArchiveModel model;

  const ArchiveModelProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child);

  static ArchiveModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ArchiveModelProvider>();
  }

  @override
  bool updateShouldNotify(ArchiveModelProvider oldWidget) {
    return true;
  }
}
