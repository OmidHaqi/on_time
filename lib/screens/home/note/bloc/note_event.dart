part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class NoteInit extends NoteEvent {}

class NoteLoadedEvent extends NoteEvent {
  final List<NoteModel> allNoteList;
  const NoteLoadedEvent(this.allNoteList);
  @override
  List<Object> get props => [allNoteList];
}

class DeleteNoteEvent extends NoteEvent {
  final int id;
  const DeleteNoteEvent(this.id);

  @override
  List<Object> get props => [id];
}

class SaveNoteEvent extends NoteEvent {
  final NoteModel saveNote;
  const SaveNoteEvent(this.saveNote);

  @override
  List<Object> get props => [saveNote];
}

class UpdateNoteEvent extends NoteEvent {
  final int id;
  final NoteModel updateNote;

  const UpdateNoteEvent(this.updateNote, this.id);

  @override
  List<Object> get props => [updateNote, id];
}

final class DeleteAllNotesEvent extends NoteEvent {}
