import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<NoteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
