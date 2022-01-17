import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(1)
  String title;

  @HiveField(2)
  String describtion;

  @HiveField(3)
  int iconId;

  @HiveField(4)
  bool isDone;

  @HiveField(5)
  bool isMarked;

  Task({
    required this.title,
    required this.describtion,
    required this.iconId,
    required this.isDone,
    required this.isMarked,
  });
}
