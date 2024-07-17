import 'package:on_time/data/models/task_model.dart';

//1
abstract class ITaskDataSrc {
  Future<List<TaskModel>> getAllTasks();
  void saveTask(TaskModel task);
  void updateTask(int id, TaskModel task);
  void deleteTask(int id);
  void deleteAllTasks();
}
