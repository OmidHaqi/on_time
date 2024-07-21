import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  int id = -1;

  @HiveField(1)
  String title;

  @HiveField(2)
  String note;

  @HiveField(3)
  int isCompleted;

  @HiveField(4)
  String date;

  @HiveField(5)
  String startTime;

  @HiveField(6)
  String endTime;

  @HiveField(7)
  int color;

  @HiveField(8)
  int remind;

  @HiveField(9)
  String repeat;

  @HiveField(10)
  String place;

  TaskModel(
      this.id,{
      required this.title,
      required this.note,
      required this.isCompleted,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.color,
      required this.remind,
      required this.repeat,
      required this.place});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
         json['id'],
        title: json['title'],
        note: json['note'],
        isCompleted: json['isCompleted'],
        date: json['date'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        color: json['color'],
        remind: json['remind'],
        repeat: json['repeat'],
        place: json['place']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = date;
    data['note'] = note;
    data['isCompleted'] = isCompleted;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['color'] = color;
    data['remind'] = remind;
    data['repeat'] = repeat;
    data['place'] = place;
    return data;
  }
}
