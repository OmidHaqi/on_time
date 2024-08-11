part of '../../index.dart';

class TaskLocalDataSrc implements ITaskDataSrc {
  TaskLocalDataSrc._constructor();

  static final _instance = TaskLocalDataSrc._constructor();

  factory TaskLocalDataSrc() => _instance;

  void close() {
    Hive.close();
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    return taskMapTOlist(box).toList();
  }

  @override
  Future<List<TaskModel>> deleteAllTasks() async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    await box.clear();
    return taskMapTOlist(box).toList();
  }

  @override
  Future<List<TaskModel>> deleteTask(int id) async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    NotificationHelper.cancelNotification(id);
    await box.delete(id);

    return taskMapTOlist(box).toList();
  }

  @override
  Future<List<TaskModel>> saveTask(TaskModel task) async {

    final box = await Hive.openBox<TaskModel>(taskBoxName);
    NotificationHelper.scheduleNotification(
      task.id,
      task.title,
      task.note,
      task.dateTime,
    );
    await box.put(task.id, task);

    return taskMapTOlist(box).toList();
  }

  @override
  Future<List<TaskModel>> updateTask(int id, TaskModel task) async {
    NotificationHelper.cancelNotification(id);
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    NotificationHelper.scheduleNotification(
      task.id,
      task.title,
      task.note,
      task.dateTime,
    );
    box.put(id, task);

    return taskMapTOlist(box).toList();
  }

  @override
  Future<List<TaskModel>> isComplateTask(
      int id, TaskModel task, bool isComplated) async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    isComplated = task.isCompleted;

    box.put(id, task);
    if (isComplated) {
      NotificationHelper.cancelNotification(id);
    } else {
      NotificationHelper.scheduleNotification(
        task.id,
        task.title,
        task.note,
        task.dateTime,
      );
    }

    return taskMapTOlist(box).toList();
  }
}

class NoteLocalDataSrc implements INoteDataSrc {
  NoteLocalDataSrc._constructor();

  static final _instance = NoteLocalDataSrc._constructor();

  factory NoteLocalDataSrc() => _instance;

  @override
  Future<List<NoteModel>> deleteAllNotes() async {
    final box = await Hive.openBox<NoteModel>(noteBoxName);
    box.clear();
    return noteMapToList(box).toList();
  }

  @override
  Future<List<NoteModel>> deleteNote(int id) async {
    final box = await Hive.openBox<NoteModel>(noteBoxName);
    box.delete(id);
    return noteMapToList(box).toList();
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final box = await Hive.openBox<NoteModel>(noteBoxName);

    return noteMapToList(box).toList();
  }

  @override
  Future<List<NoteModel>> saveNote(NoteModel note) async {
    final box = await Hive.openBox<NoteModel>(noteBoxName);

    box.put(note.id, note);
    return noteMapToList(box).toList();
  }

  @override
  Future<List<NoteModel>> updateNote(int id, NoteModel note) async {
    final box = await Hive.openBox<NoteModel>(noteBoxName);
    box.put(id, note);
    return noteMapToList(box).toList();
  }
}
