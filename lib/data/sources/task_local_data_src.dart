import 'dart:io';
import 'package:hive/hive.dart';
import 'package:on_time/data/models/task_model.dart';
import 'package:on_time/data/sources/task_data_src.dart';
import 'package:on_time/resource/constants.dart';
import 'package:path_provider/path_provider.dart';

class TaskLocalDataSrc implements ITaskDataSrc {
  TaskLocalDataSrc._constructor();

  static final TaskLocalDataSrc _instance = TaskLocalDataSrc._constructor();

  factory TaskLocalDataSrc() => _instance;

  Future<void> initialize() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<TaskModel>(taskBox);
    await Hive.openBox(latestIdBox);
  }

  void close() {
    // Closes all Hive boxes
    Hive.close();
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final box = await Hive.openBox<TaskModel>(taskBox);
    return box.values
        .map(
          (_) => TaskModel(
            title: _.title,
            note: _.note,
            isCompleted: _.isCompleted,
            date: _.date,
            startTime: _.startTime,
            endTime: _.endTime,
            color: _.color,
            remind: _.remind,
            repeat: _.repeat,
          ),
        )
        .toList();
  }

  @override
  void deleteAllTasks() async {
    final box = await Hive.openBox<TaskModel>(taskBox);
    await box.clear();
  }

  @override
  void deleteTask(int id) async {
    final box = await Hive.openBox<TaskModel>(taskBox);
    await box.delete(id);
  }

  @override
  void saveTask(TaskModel task) async {
    final lastestIdBox = await Hive.openBox(latestIdBox);
    int latestId = lastestIdBox.get(latestIdName, defaultValue: 0);
    int newLatestId = latestId + 1;
    var taskModel = TaskModel(
      id: newLatestId,
      title: task.title,
      note: task.note,
      isCompleted: task.isCompleted,
      date: task.date,
      startTime: task.startTime,
      endTime: task.endTime,
      color: task.color,
      remind: task.remind,
      repeat: task.repeat,
    );
    final box = await Hive.openBox<TaskModel>(taskBox);
    await box.put(taskModel.id, taskModel);
    await lastestIdBox.put(lastestIdBox, newLatestId);
  }

  @override
  void updateTask(int id, TaskModel task) async {
    final box = await Hive.openBox<TaskModel>(taskBox);

    box.put(
      task.id,
      TaskModel(
        title: task.title,
        note: task.note,
        isCompleted: task.isCompleted,
        date: task.date,
        startTime: task.startTime,
        endTime: task.endTime,
        color: task.color,
        remind: task.remind,
        repeat: task.repeat,
      ),
    );
  }
}
