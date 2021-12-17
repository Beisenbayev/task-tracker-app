import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(1)
  String title;

  @HiveField(2)
  String text;

  @HiveField(3)
  bool isDone = false;

  @HiveField(4)
  int colorId;

  @HiveField(5)
  bool isMarked = false;

  Task({
    required this.title,
    required this.text,
    required this.colorId,
  });
}
