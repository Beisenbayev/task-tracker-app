import 'package:flutter/material.dart';

class EditTaskModel {
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
