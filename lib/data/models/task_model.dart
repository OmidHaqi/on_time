import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String note;

  @HiveField(3)
  bool isCompleted;

  @HiveField(4)
  final DateTime dateTime;

  @HiveField(5)
  final TaskColor color;

  @HiveField(6)
  final String place;

  TaskModel(
      {required this.id,
      required this.title,
      required this.note,
      required this.isCompleted,
      required this.dateTime,
      required this.color,
      required this.place});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        note: json['note'],
        isCompleted: json['isCompleted'],
        dateTime: json['date'],
        color: json['color'],
        place: json['place']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = dateTime;
    data['note'] = note;
    data['isCompleted'] = isCompleted;
    data['color'] = color;
    data['place'] = place;
    return data;
  }
}

@HiveType(typeId: 1)
enum TaskColor {
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

  const TaskColor(this.code);
}
