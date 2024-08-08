part of '../../index.dart';

abstract class ITaskRepo {
  Future<List<TaskModel>> getAllTasks();
  Future<List<TaskModel>> saveTask(TaskModel task);
  Future<List<TaskModel>> updateTask(int id, TaskModel task);
  Future<List<TaskModel>> deleteTask(int id);
  Future<List<TaskModel>> deleteAllTasks();
  Future<List<TaskModel>> isComplateTask(int id, TaskModel task,bool isComplated);
}

abstract class INoteRepo {
  Future<List<NoteModel>> getAllNotes();
  Future<List<NoteModel>> saveNote(NoteModel note);
  Future<List<NoteModel>> updateNote(String id, NoteModel note);
  Future<List<NoteModel>> deleteNote(String id);
  Future<List<NoteModel>> deleteAllNotes();
}
