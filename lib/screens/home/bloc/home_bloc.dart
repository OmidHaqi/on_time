import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:on_time/data/models/task_model.dart';
import 'package:on_time/data/repositories/task_local_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TaskLocalRepo taskRepo;
  HomeBloc(this.taskRepo) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInit) {
        try {
          emit(HomeLoading());
          final home = await taskRepo.getAllTasks();

          emit(HomeLoaded(home));
        } catch (e) {
          emit(HomeError());
        }
      }
    });
  }
}
