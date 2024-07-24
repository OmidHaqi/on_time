part of '../../index.dart';

class LocalDataSrc implements ITaskDataSrc, INoteDataSrc {
  LocalDataSrc._constructor();

  static final _instance = LocalDataSrc._constructor();

  factory LocalDataSrc() => _instance;

  void close() {
    // Closes all Hive boxes
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
  Future<List<TaskModel>> deleteTask(String id) async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);
    await box.delete(id);
    return taskMapTOlist(box).toList();
  }

  @override
  Future<List<TaskModel>> saveTask(TaskModel task) async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);

    var uuid= const Uuid();
    task.id = uuid.v4();

    await box.put(task.id,task);
    return taskMapTOlist(box).toList();
  }

  @override
  Future<List<TaskModel>> updateTask(String id, TaskModel task) async {
    final box = await Hive.openBox<TaskModel>(taskBoxName);

    box.put(id, task);

    return taskMapTOlist(box).toList();
  }

  @override
  Future<List<NoteModel>> deleteAllNotes() async {
    final box = await Hive.openBox<NoteModel>(noteBoxName);
    box.clear();
    return noteMapToList(box).toList();
  }

  @override
  Future<List<NoteModel>> deleteNote(String id) async {
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
    box.add(note);
    return noteMapToList(box).toList();
  }

  @override
  Future<List<NoteModel>> updateNote(String id, NoteModel note) async {
    final box = await Hive.openBox<NoteModel>(noteBoxName);
    box.put(id, note);
    return noteMapToList(box).toList();
  }
}
