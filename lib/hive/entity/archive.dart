import 'package:hive/hive.dart';

part 'archive.g.dart';

@HiveType(typeId: 2)
class Archive extends HiveObject {
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

  @HiveField(6)
  dynamic taskKey;

  @HiveField(7)
  dynamic categoryKey;

  Archive({
    required this.title,
    required this.describtion,
    required this.iconId,
    required this.isDone,
    required this.isMarked,
    required this.taskKey,
    required this.categoryKey,
  });
}
