part of '../../index.dart';

abstract class ITaskDataSrc {
  Future<List<TaskModel>> getAllTasks();
  Future<List<TaskModel>> saveTask(TaskModel task);
  Future<List<TaskModel>> updateTask(String id, TaskModel task);
  Future<List<TaskModel>> deleteTask(String id);
  Future<List<TaskModel>> deleteAllTasks();
}

abstract class INoteDataSrc {
  Future<List<NoteModel>> getAllNotes();
  Future<List<NoteModel>> saveNote(NoteModel note);
  Future<List<NoteModel>> updateNote(String id, NoteModel note);
  Future<List<NoteModel>> deleteNote(String id);
  Future<List<NoteModel>> deleteAllNotes();
}
