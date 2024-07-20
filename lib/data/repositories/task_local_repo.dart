import 'package:on_time/data/models/task_model.dart';
import 'package:on_time/data/repositories/task_repo.dart';
import 'package:on_time/data/sources/task_data_src.dart';
import 'package:on_time/data/sources/task_local_data_src.dart';

final taskLocalRepo = TaskLocalRepo(TaskLocalDataSrc());

class TaskLocalRepo implements ITaskRepo {
  final ITaskDataSrc _iTaskDataSrc;

  TaskLocalRepo(this._iTaskDataSrc);

  @override
  Future<List<TaskModel>> deleteAllTasks() => _iTaskDataSrc.deleteAllTasks();

  @override
  Future<List<TaskModel>> deleteTask(int id) => _iTaskDataSrc.deleteTask(id);

  @override
  Future<List<TaskModel>> getAllTasks() => _iTaskDataSrc.getAllTasks();

  @override
  Future<List<TaskModel>> saveTask(TaskModel task) => _iTaskDataSrc.saveTask(task);

  @override
  Future<List<TaskModel>> updateTask(int id, TaskModel task) => _iTaskDataSrc.updateTask(id, task);

  // @override
  // Future<List<TaskModel>> addTask(TaskModel task) => _iTaskDataSrc.addTask(task);
}
