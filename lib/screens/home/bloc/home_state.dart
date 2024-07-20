part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final List<TaskModel> taskList;
  const HomeLoadedState(this.taskList);
  @override
  List<Object> get props => [taskList];
}

final class DeleteTaskState extends HomeState {
  final List<TaskModel> taskTask;
  const DeleteTaskState(this.taskTask);

  @override
  List<Object> get props => [taskTask];
}

final class SaveTaskState extends HomeState {
  final List<TaskModel> taskList;
  const SaveTaskState(this.taskList);

  @override
  List<Object> get props => [taskList];
}

final class UpdateTaskState extends HomeState {
  final List<TaskModel> taskList;
  const UpdateTaskState(this.taskList);

  @override
  List<Object> get props => [taskList];
}

final class DeleteAllTasksState extends HomeState {
  final List<TaskModel> taskList;
  const DeleteAllTasksState(this.taskList);

  @override
  List<Object> get props => [taskList];
}

final class HomeError extends HomeState {}

// final class AddTaskState extends HomeState {
//   final TaskModel addTask;

//   const AddTaskState(this.addTask);
//   @override
//   List<Object> get props => [addTask];
// }
