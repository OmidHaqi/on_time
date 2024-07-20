part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInit extends HomeEvent {}

class HomeLoadedEvent extends HomeEvent {
  final List<TaskModel> allTaskList;
  const HomeLoadedEvent(this.allTaskList);
  @override
  List<Object> get props => [allTaskList];
}

class DeleteTaskEvent extends HomeEvent {
  final int id;
  const DeleteTaskEvent(this.id);

  @override
  List<Object> get props => [id];
}

class SaveTaskEvent extends HomeEvent {
  final TaskModel saveTask;
  const SaveTaskEvent(this.saveTask);

  @override
  List<Object> get props => [saveTask];
}

class UpdateTaskEvent extends HomeEvent {
  final int id;
  final TaskModel updateTask;

  const UpdateTaskEvent(this.updateTask, this.id);

  @override
  List<Object> get props => [updateTask, id];
}

final class DeleteAllTasksEvent extends HomeEvent {}

// final class AddTasksEvent extends HomeEvent {

//   final TaskModel addTask;


//   const AddTasksEvent(this.addTask);
//   @override
//   List<Object> get props => [addTask];
// }
