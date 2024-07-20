import 'package:on_time/data/models/task_model.dart';

//1
abstract class ITaskDataSrc {
  Future<List<TaskModel>> getAllTasks();
  // Future<List<TaskModel>> addTask(TaskModel task);
  Future<List<TaskModel>> saveTask(TaskModel task);
  Future<List<TaskModel>> updateTask(int id, TaskModel task);
  Future<List<TaskModel>>deleteTask(int id);
  Future<List<TaskModel>> deleteAllTasks();
  
}
