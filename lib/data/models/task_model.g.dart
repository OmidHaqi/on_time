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
      isCompleted: fields[3] as int,
      date: fields[4] as DateTime,
      startTime: fields[5] as String,
      endTime: fields[6] as String,
      color: fields[7] as TodoColor,
      remind: fields[8] as int,
      repeat: fields[9] as String,
      place: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.note)
      ..writeByte(3)
      ..write(obj.isCompleted)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.startTime)
      ..writeByte(6)
      ..write(obj.endTime)
      ..writeByte(7)
      ..write(obj.color)
      ..writeByte(8)
      ..write(obj.remind)
      ..writeByte(9)
      ..write(obj.repeat)
      ..writeByte(10)
      ..write(obj.place);
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

class TaskColorAdapter extends TypeAdapter<TodoColor> {
  @override
  final int typeId = 1;

  @override
  TodoColor read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TodoColor.one;
      case 1:
        return TodoColor.two;
      case 2:
        return TodoColor.three;
      case 3:
        return TodoColor.four;
      case 4:
        return TodoColor.five;
      case 5:
        return TodoColor.six;
      default:
        return TodoColor.one;
    }
  }

  @override
  void write(BinaryWriter writer, TodoColor obj) {
    switch (obj) {
      case TodoColor.one:
        writer.writeByte(0);
        break;
      case TodoColor.two:
        writer.writeByte(1);
        break;
      case TodoColor.three:
        writer.writeByte(2);
        break;
      case TodoColor.four:
        writer.writeByte(3);
        break;
      case TodoColor.five:
        writer.writeByte(4);
        break;
      case TodoColor.six:
        writer.writeByte(5);
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
