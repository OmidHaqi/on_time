part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskLoadingState extends TaskState {}

final class TaskLoadedState extends TaskState {
  final List<TaskModel> taskList;
  const TaskLoadedState(this.taskList);
  @override
  List<Object> get props => [taskList];
}

final class DeleteTaskState extends TaskState {
  final List<TaskModel> taskTask;
  const DeleteTaskState(this.taskTask);

  @override
  List<Object> get props => [taskTask];
}

final class SaveTaskState extends TaskState {
  final List<TaskModel> taskList;
  const SaveTaskState(this.taskList);

  @override
  List<Object> get props => [taskList];
}

final class UpdateTaskState extends TaskState {
  final List<TaskModel> taskList;
  const UpdateTaskState(this.taskList);

  @override
  List<Object> get props => [taskList];
}

final class DeleteAllTasksState extends TaskState {
  final List<TaskModel> taskList;
  const DeleteAllTasksState(this.taskList);

  @override
  List<Object> get props => [taskList];
}

final class IsComplatedTaskState extends TaskState {
  final List<TaskModel> taskList;
  const IsComplatedTaskState(this.taskList);

  @override
  List<Object> get props => [taskList];
}

final class TaskError extends TaskState {}
