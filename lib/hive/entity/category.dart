import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 0)
class Category extends HiveObject {
  @HiveField(1)
  String title;

  @HiveField(2)
  int colorId;

  @HiveField(3)
  int iconId;

  Category({
    required this.title,
    required this.colorId,
    required this.iconId,
  });
}
