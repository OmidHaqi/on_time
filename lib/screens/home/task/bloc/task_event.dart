part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class TaskInit extends TaskEvent {}

class TaskLoadedEvent extends TaskEvent {
  final List<TaskModel> allTaskList;
  const TaskLoadedEvent(this.allTaskList);
  @override
  List<Object> get props => [allTaskList];
}

class DeleteTaskEvent extends TaskEvent {
  final int id;
  const DeleteTaskEvent(this.id);

  @override
  List<Object> get props => [id];
}

class SaveTaskEvent extends TaskEvent {
  final TaskModel saveTask;
  const SaveTaskEvent(this.saveTask);

  @override
  List<Object> get props => [saveTask];
}

class UpdateTaskEvent extends TaskEvent {
  final int id;
  final TaskModel updateTask;

  const UpdateTaskEvent(this.updateTask, this.id);

  @override
  List<Object> get props => [updateTask, id];
}

class IsComplatedTaskEvent extends TaskEvent {
  final int id;
  final TaskModel isComplatedTask;
  final bool isCompleted;

  const IsComplatedTaskEvent(
    this.isComplatedTask,
    this.id,
    this.isCompleted,
  );

  @override
  List<Object> get props => [isComplatedTask, id,isCompleted];
}

final class DeleteAllTasksEvent extends TaskEvent {}
