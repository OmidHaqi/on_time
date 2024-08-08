import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:on_time/data/models/task_model.dart';
import '../../../../index.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskLocalRepo taskRepo;
  TaskBloc(this.taskRepo) : super(TaskLoadingState()) {
    on<TaskEvent>(
      (event, emit) async {
        if (event is TaskInit) {
          try {
            emit(TaskLoadingState());
            final taskList = await taskRepo.getAllTasks();
            emit(TaskLoadedState(taskList));
          } catch (e) {
            emit(TaskError());
          }
        } else if (event is DeleteTaskEvent) {
          try {
            emit(TaskLoadingState());
            await taskRepo.deleteTask(event.id).then(
                  (val) => emit(
                    DeleteTaskState(val),
                  ),
                );
          } catch (e) {
            emit(TaskError());
          }
        } else if (event is DeleteAllTasksEvent) {
          emit(TaskLoadingState());
          await taskRepo.deleteAllTasks().then(
                (val) => emit(
                  DeleteAllTasksState(val),
                ),
              );
        } else if (event is SaveTaskEvent) {
          emit(TaskLoadingState());
          await taskRepo
              .saveTask(
                event.saveTask,
              )
              .then(
                (val) => emit(
                  SaveTaskState(val),
                ),
              );
        } else if (event is UpdateTaskEvent) {
          emit(TaskLoadingState());
          await taskRepo
              .updateTask(
                event.id,
                event.updateTask,
              )
              .then(
                (val) => emit(
                  UpdateTaskState(val),
                ),
              );
        } else if (event is IsComplatedTaskEvent) {
          try {
            emit(TaskLoadingState());
            final updatedTaskList = await taskRepo.isComplateTask(
              event.id,
              event.isComplatedTask,
              event.isCompleted
            );
            emit(TaskLoadedState(updatedTaskList));
          } catch (e) {
            emit(TaskError());
          }
        }
      },
    );
  }
}
