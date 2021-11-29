import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Group {
  @HiveField(1)
  final String name;

  @HiveField(2)
  final HiveList tasks;

  Group({
    required this.name,
    required this.tasks,
  });
}
