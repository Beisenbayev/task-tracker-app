import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/entity/group.dart';

class GroupsModel extends ChangeNotifier {
  List<Group> _groups = [];

  GroupsModel() {
    _setup();
  }

  List<Group> get groups => _groups;

  void notifyListenChange(Box<Group> box) {
    _groups = box.values.toList();
    notifyListeners();
  }

  Future<void> _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    notifyListenChange(box);
    box.listenable().addListener(() => notifyListenChange(box));
  }

  Future<void> removeGroup(int index) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    box.deleteAt(index);
  }
}

class GroupsModelProvider extends InheritedNotifier {
  final GroupsModel model;

  const GroupsModelProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static GroupsModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupsModelProvider>();
  }

  @override
  bool updateShouldNotify(GroupsModelProvider oldWidget) {
    return true;
  }
}
