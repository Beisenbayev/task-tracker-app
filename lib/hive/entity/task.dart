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

  Task({
    required this.title,
    required this.describtion,
    required this.iconId,
  });
}
