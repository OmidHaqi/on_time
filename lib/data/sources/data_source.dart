part of '../../index.dart';

abstract class ITaskDataSrc {
  Future<List<TaskModel>> getAllTasks();
  Future<List<TaskModel>> saveTask(TaskModel task);
  Future<List<TaskModel>> updateTask(int id, TaskModel task);
  Future<List<TaskModel>> deleteTask(int id);
  Future<List<TaskModel>> deleteAllTasks();
  Future<List<TaskModel>> isComplateTask(int id , TaskModel task,bool isComplated);
}

abstract class INoteDataSrc {
  Future<List<NoteModel>> getAllNotes();
  Future<List<NoteModel>> saveNote(NoteModel note);
  Future<List<NoteModel>> updateNote(int id, NoteModel note);
  Future<List<NoteModel>> deleteNote(int id);
  Future<List<NoteModel>> deleteAllNotes();
}
