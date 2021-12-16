import 'package:flutter/material.dart';
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
  Color color;

  Task({
    required this.title,
    required this.text,
    required this.color,
  });
}
