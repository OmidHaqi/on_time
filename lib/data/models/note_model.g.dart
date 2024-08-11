// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteModelAdapter extends TypeAdapter<NoteModel> {
  @override
  final int typeId = 2;

  @override
  NoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteModel(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      color: fields[3] as NoteColor,
      dateTime: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NoteColorAdapter extends TypeAdapter<NoteColor> {
  @override
  final int typeId = 3;

  @override
  NoteColor read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NoteColor.one;
      case 1:
        return NoteColor.two;
      case 2:
        return NoteColor.three;
      case 3:
        return NoteColor.four;
      case 4:
        return NoteColor.five;
      case 5:
        return NoteColor.six;
      case 6:
        return NoteColor.seven;
      case 7:
        return NoteColor.eight;
      case 8:
        return NoteColor.nine;
      default:
        return NoteColor.one;
    }
  }

  @override
  void write(BinaryWriter writer, NoteColor obj) {
    switch (obj) {
      case NoteColor.one:
        writer.writeByte(0);
        break;
      case NoteColor.two:
        writer.writeByte(1);
        break;
      case NoteColor.three:
        writer.writeByte(2);
        break;
      case NoteColor.four:
        writer.writeByte(3);
        break;
      case NoteColor.five:
        writer.writeByte(4);
        break;
      case NoteColor.six:
        writer.writeByte(5);
        break;
      case NoteColor.seven:
        writer.writeByte(6);
        break;
      case NoteColor.eight:
        writer.writeByte(7);
        break;
      case NoteColor.nine:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
