import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(1)
  String title;

  @HiveField(2)
  String text;

  @HiveField(3)
  bool isDone = false;

  Task({
    required this.title,
    required this.text,
  });
}
