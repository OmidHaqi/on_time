part of '../../index.dart';

final taskLocalRepo = TaskLocalRepo(LocalDataSrc());
final noteLocalRepo = NoteLocalRepo(LocalDataSrc());

class TaskLocalRepo implements ITaskRepo {
  final ITaskDataSrc _iTaskDataSrc;

  TaskLocalRepo(this._iTaskDataSrc);

  @override
  Future<List<TaskModel>> deleteAllTasks() => _iTaskDataSrc.deleteAllTasks();

  @override
  Future<List<TaskModel>> deleteTask(String id) => _iTaskDataSrc.deleteTask(id);

  @override
  Future<List<TaskModel>> getAllTasks() => _iTaskDataSrc.getAllTasks();

  @override
  Future<List<TaskModel>> saveTask(TaskModel task) =>
      _iTaskDataSrc.saveTask(task);

  @override
  Future<List<TaskModel>> updateTask(String id, TaskModel task) =>
      _iTaskDataSrc.updateTask(id, task);
}

class NoteLocalRepo implements INoteRepo {
  final INoteDataSrc _iNoteDataSrc;

  NoteLocalRepo(this._iNoteDataSrc);
  @override
  Future<List<NoteModel>> deleteAllNote() => _iNoteDataSrc.deleteAllNotes();

  @override
  Future<List<NoteModel>> deleteNote(String id) => _iNoteDataSrc.deleteNote(id);

  @override
  Future<List<NoteModel>> getAllNotes() => _iNoteDataSrc.getAllNotes();

  @override
  Future<List<NoteModel>> saveNote(NoteModel note) =>
      _iNoteDataSrc.saveNote(note);

  @override
  Future<List<NoteModel>> updateNote(String id, NoteModel note) =>
      _iNoteDataSrc.updateNote(id, note);
}
