import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(1)
  final String title;

  @HiveField(2)
  final String text;

  Task({
    required this.title,
    required this.text,
  });
}
