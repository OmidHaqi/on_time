import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:on_time/data/models/note_model.dart';
import 'package:on_time/index.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteLocalRepo noteRepo;
  NoteBloc(this.noteRepo) : super(NoteLoadingState()) {
    on<NoteEvent>((event, emit) async {
      if (event is NoteInit) {
        try {
          emit(NoteLoadingState());
          final noteList = await noteRepo.getAllNotes();
          emit(NoteLoadedState(noteList));
        } catch (e) {
          emit(NoteError());
        }
      } else if (event is DeleteNoteEvent) {
        try {
          emit(NoteLoadingState());
          await noteRepo.deleteNote(event.id).then(
                (val) => emit(
                  DeleteNoteState(val),
                ),
              );
        } catch (e) {
          emit(NoteError());
        }
      } else if (event is DeleteAllNotesEvent) {
        emit(NoteLoadingState());
        await noteRepo.deleteAllNotes().then(
              (val) => emit(
                DeleteAllNotesState(val),
              ),
            );
      } else if (event is SaveNoteEvent) {
        emit(NoteLoadingState());
        await noteRepo
            .saveNote(
              event.saveNote,
            )
            .then(
              (val) => emit(
                SaveNoteState(val),
              ),
            );
      } else if (event is UpdateNoteEvent) {
        emit(NoteLoadingState());
        await noteRepo
            .updateNote(
              event.id,
              event.updateNote,
            )
            .then(
              (val) => emit(
                UpdateNoteState(val),
              ),
            );
      }
    });
  }
}
