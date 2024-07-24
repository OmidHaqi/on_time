part of '../../index.dart';

class TaskLocalDataSrc implements ITaskDataSrc {
  TaskLocalDataSrc._constructor();

  static final TaskLocalDataSrc _instance = TaskLocalDataSrc._constructor();

  factory TaskLocalDataSrc() => _instance;

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
            id: _.id,
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
            id: _.id,
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
    try {
      final box = await Hive.openBox<TaskModel>(taskBoxName);
      await box.delete(id);
      return box.values
          .map(
            (_) => TaskModel(
              id: _.id,
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
    } catch (e) {
      print('#############################$e');
      return [];
    }
  }

  @override
  Future<List<TaskModel>> saveTask(TaskModel task) async {
    var taskModel = TaskModel(
      id: task.id,
      title: task.title,
      note: task.note,
      isCompleted: task.isCompleted,
      date: task.date,
      startTime: task.startTime,
      endTime: task.endTime,
      color: task.color,
      remind: task.remind,
      repeat: task.repeat,
      place: task.place,
    );
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    await box.add(taskModel);
    return box.values
        .map(
          (_) => TaskModel(
            id: _.id,
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
      TaskModel(
        id: task.id,
        title: task.title,
        note: task.note,
        isCompleted: task.isCompleted,
        date: task.date,
        startTime: task.startTime,
        endTime: task.endTime,
        color: task.color,
        remind: task.remind,
        repeat: task.repeat,
        place: task.place,
      ),
    );

    return box.values
        .map(
          (_) => TaskModel(
            id: _.id,
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
