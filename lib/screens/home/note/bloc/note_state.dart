part of 'note_bloc.dart';

sealed class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

final class NoteLoadingState extends NoteState {}

final class NoteLoadedState extends NoteState {
  final List<NoteModel> noteList;
  const NoteLoadedState(this.noteList);
  @override
  List<Object> get props => [noteList];
}

final class DeleteNoteState extends NoteState {
  final List<NoteModel> noteList;
  const DeleteNoteState(this.noteList);

  @override
  List<Object> get props => [noteList];
}

final class SaveNoteState extends NoteState {
  final List<NoteModel> noteList;
  const SaveNoteState(this.noteList);

  @override
  List<Object> get props => [noteList];
}

final class UpdateNoteState extends NoteState {
  final List<NoteModel> noteList;
  const UpdateNoteState(this.noteList);

  @override
  List<Object> get props => [noteList];
}

final class DeleteAllNotesState extends NoteState {
  final List<NoteModel> noteList;
  const DeleteAllNotesState(this.noteList);

  @override
  List<Object> get props => [noteList];
}

final class NoteError extends NoteState {}
