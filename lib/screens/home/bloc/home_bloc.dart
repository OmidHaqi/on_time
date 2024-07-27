import 'package:bloc/bloc.dart';
import 'package:on_time/screens/home/bloc/home_event.dart';
import 'package:on_time/screens/home/bloc/home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<ChangePage>(_onChangePage);
  }

  void _onChangePage(ChangePage event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedPageIndex: event.pageIndex));
  }
}