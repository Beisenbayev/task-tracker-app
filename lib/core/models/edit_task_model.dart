import 'package:flutter/material.dart';
import 'package:to_do_app/hive/hive_boxes.dart';

class EditTaskModel {
  final int index;
  final _tasksBox = HiveBoxes.getTasksBox();

  void getKey() {
    print(_tasksBox.keyAt(index));
  }

  EditTaskModel(this.index);

  void saveTaskChanges(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class EditTaskModelProvider extends InheritedWidget {
  final EditTaskModel model;

  const EditTaskModelProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child);

  static EditTaskModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EditTaskModelProvider>();
  }

  @override
  bool updateShouldNotify(EditTaskModelProvider oldWidget) {
    return false;
  }
}
