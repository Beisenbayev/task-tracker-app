import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(1)
  final String title;

  @HiveField(2)
  final String describtion;

  @HiveField(3)
  final String iconId;

  @HiveField(4)
  final String isDone;

  @HiveField(5)
  final String isMarked;

  Task({
    required this.title,
    required this.describtion,
    required this.iconId,
    required this.isDone,
    required this.isMarked,
  });
}
