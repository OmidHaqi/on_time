// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      id: fields[0] as int,
      title: fields[1] as String,
      note: fields[2] as String,
      isCompleted: fields[3] as bool,
      dateTime: fields[4] as DateTime,
      color: fields[5] as TaskColor,
      addToNote: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.note)
      ..writeByte(3)
      ..write(obj.isCompleted)
      ..writeByte(4)
      ..write(obj.dateTime)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.addToNote);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskColorAdapter extends TypeAdapter<TaskColor> {
  @override
  final int typeId = 1;

  @override
  TaskColor read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskColor.one;
      case 1:
        return TaskColor.two;
      case 2:
        return TaskColor.three;
      case 3:
        return TaskColor.four;
      case 4:
        return TaskColor.five;
      case 5:
        return TaskColor.six;
      case 6:
        return TaskColor.seven;
      case 7:
        return TaskColor.eight;
      case 8:
        return TaskColor.nine;
      default:
        return TaskColor.one;
    }
  }

  @override
  void write(BinaryWriter writer, TaskColor obj) {
    switch (obj) {
      case TaskColor.one:
        writer.writeByte(0);
        break;
      case TaskColor.two:
        writer.writeByte(1);
        break;
      case TaskColor.three:
        writer.writeByte(2);
        break;
      case TaskColor.four:
        writer.writeByte(3);
        break;
      case TaskColor.five:
        writer.writeByte(4);
        break;
      case TaskColor.six:
        writer.writeByte(5);
        break;
      case TaskColor.seven:
        writer.writeByte(6);
        break;
      case TaskColor.eight:
        writer.writeByte(7);
        break;
      case TaskColor.nine:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
