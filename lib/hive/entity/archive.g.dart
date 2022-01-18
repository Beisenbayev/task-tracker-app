// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArchiveAdapter extends TypeAdapter<Archive> {
  @override
  final int typeId = 2;

  @override
  Archive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Archive(
      title: fields[1] as String,
      describtion: fields[2] as String,
      iconId: fields[3] as int,
      isDone: fields[4] as bool,
      isMarked: fields[5] as bool,
      taskKey: fields[6] as dynamic,
      categoryKey: fields[7] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Archive obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.describtion)
      ..writeByte(3)
      ..write(obj.iconId)
      ..writeByte(4)
      ..write(obj.isDone)
      ..writeByte(5)
      ..write(obj.isMarked)
      ..writeByte(6)
      ..write(obj.taskKey)
      ..writeByte(7)
      ..write(obj.categoryKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArchiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
