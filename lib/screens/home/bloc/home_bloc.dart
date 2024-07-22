import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:on_time/data/models/task_model.dart';
import '../../../index.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TaskLocalRepo taskRepo;
  HomeBloc(this.taskRepo) : super(HomeLoadingState()) {
    on<HomeEvent>(
      (event, emit) async {
        if (event is HomeInit) {
          try {
            emit(HomeLoadingState());
            final home = await taskRepo.getAllTasks();

            emit(
              HomeLoadedState(
                home,
              ),
            );
          } catch (e) {
            emit(HomeError());
          }
        } else if (event is DeleteTaskEvent) {
          try {
            emit(HomeLoadingState());
            await taskRepo.deleteTask(event.id).then(
                  (val) => emit(
                    DeleteTaskState(val),
                  ),
                );
          } catch (e) {

            emit(HomeError());
            
          }
        } else if (event is DeleteAllTasksEvent) {
          emit(HomeLoadingState());
          await taskRepo.deleteAllTasks().then(
                (val) => emit(
                  DeleteAllTasksState(val),
                ),
              );
        } else if (event is SaveTaskEvent) {
          emit(HomeLoadingState());
          await taskRepo.saveTask(event.saveTask).then(
                (val) => emit(
                  SaveTaskState(val),
                ),
              );
        } else if (event is UpdateTaskEvent) {
          emit(HomeLoadingState());
          await taskRepo.updateTask(event.id, event.updateTask).then(
                (val) => emit(
                  UpdateTaskState(val),
                ),
              );
        }
      },
    );
  }
}
