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
    await Hive.openBox<TaskModel>(taskBoxName);

    
    // await Hive.openBox(latestIdBox);
  }

  void close() {
   // Closes all Hive boxes
    Hive.close();
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    return box.values
        .map(
          (_) => TaskModel(
            _.id,
            title: _.title,
            note: _.note,
            isCompleted: _.isCompleted,
            date: _.date,
            startTime: _.startTime,
            endTime: _.endTime,
            color: _.color,
            remind: _.remind,
            repeat: _.repeat,
            place: _.place,
          ),
        )
        .toList();
  }

  @override
  Future<List<TaskModel>> deleteAllTasks() async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    await box.clear();
    return box.values
        .map(
          (_) => TaskModel(
            _.id,
            title: _.title,
            note: _.note,
            isCompleted: _.isCompleted,
            date: _.date,
            startTime: _.startTime,
            endTime: _.endTime,
            color: _.color,
            remind: _.remind,
            repeat: _.repeat,
            place: _.place,
          ),
        )
        .toList();
  }

  @override
  Future<List<TaskModel>> deleteTask(int id) async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    await box.delete(id);
    return box.values
        .map(
          (_) => TaskModel(
            _.id,
            title: _.title,
            note: _.note,
            isCompleted: _.isCompleted,
            date: _.date,
            startTime: _.startTime,
            endTime: _.endTime,
            color: _.color,
            remind: _.remind,
            repeat: _.repeat,
            place: _.place,
          ),
        )
        .toList();
  }

  @override
  Future<List<TaskModel>> saveTask(TaskModel task) async {
    // final lastestIdBox = await Hive.openBox(latestIdBox);
    // int latestId = lastestIdBox.get(latestIdName, defaultValue: 0);
    // int newLatestId = latestId + 1;
    var taskModel = TaskModel(task.id,
        title: task.title,
        note: task.note,
        isCompleted: task.isCompleted,
        date: task.date,
        startTime: task.startTime,
        endTime: task.endTime,
        color: task.color,
        remind: task.remind,
        repeat: task.repeat,
        place: task.place);
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    await box.put(taskModel.id, taskModel);
    return box.values
        .map(
          (_) => TaskModel(
            _.id,
            title: _.title,
            note: _.note,
            isCompleted: _.isCompleted,
            date: _.date,
            startTime: _.startTime,
            endTime: _.endTime,
            color: _.color,
            remind: _.remind,
            repeat: _.repeat,
            place: _.place,
          ),
        )
        .toList();
  }

  @override
  Future<List<TaskModel>> updateTask(int id, TaskModel task) async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);

    box.put(
      task.id,
      TaskModel(task.id,
          title: task.title,
          note: task.note,
          isCompleted: task.isCompleted,
          date: task.date,
          startTime: task.startTime,
          endTime: task.endTime,
          color: task.color,
          remind: task.remind,
          repeat: task.repeat,
          place: task.place),
    );

    return box.values
        .map(
          (_) => TaskModel(
            _.id,
            title: _.title,
            note: _.note,
            isCompleted: _.isCompleted,
            date: _.date,
            startTime: _.startTime,
            endTime: _.endTime,
            color: _.color,
            remind: _.remind,
            repeat: _.repeat,
            place: _.place,
          ),
        )
        .toList();
  }

  // @override
  // Future<List<TaskModel>> addTask(TaskModel task) async {
  //   final box = await Hive.openBox<TaskModel>(taskBox);
  //   box.add(task);
  //   // List<TaskModel> list = box.values
  //   //     .map(
  //   //       (_) => TaskModel(
  //   //         title: _.title,
  //   //         note: _.note,
  //   //         isCompleted: _.isCompleted,
  //   //         date: _.date,
  //   //         startTime: _.startTime,
  //   //         endTime: _.endTime,
  //   //         color: _.color,
  //   //         remind: _.remind,
  //   //         repeat: _.repeat,
  //   //         place: _.place,
  //   //       ),
  //   //     )
  //   //     .toList();
  //   // return list;
  // }
}
