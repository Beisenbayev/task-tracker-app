import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId : 1)
class Group {
  @HiveField(1)
  final String name;

  Group({required this.name});
}
