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
  final String id;
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
  final String id;
  final TaskModel updateTask;

  const UpdateTaskEvent(this.updateTask, this.id);

  @override
  List<Object> get props => [updateTask, id];
}

final class DeleteAllTasksEvent extends TaskEvent {}
