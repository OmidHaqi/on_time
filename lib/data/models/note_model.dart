import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 2)
class NoteModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final NoteColor color;

  @HiveField(4)
  final String dateTime;

  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.dateTime,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      color: json['color'],
      dateTime: json['dateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'color': color,
      'dateTime': dateTime,
    };
  }
}

@HiveType(typeId: 3)
enum NoteColor {
  @HiveField(0)
  one(0xffe6ee9b),

  @HiveField(1)
  two(0xff80deea),

  @HiveField(2)
  three(0xffcf93d9),

  @HiveField(3)
  four(0xffffab91),

  @HiveField(4)
  five(0xffffcc80),

  @HiveField(5)
  six(0xffC4BBF0),

  @HiveField(6)
  seven(0xffFFD717),

  @HiveField(7)
  eight(0xffFFC7C7),

  @HiveField(8)
  nine(0xffCCF6C8);

  final int code;

  const NoteColor(this.code);
}
