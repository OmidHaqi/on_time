part of '../../../../../index.dart';

Box<NoteModel> noteBox = Hive.box<NoteModel>(noteBoxName);

class Notes extends StatelessWidget {
  const Notes({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state is DeleteNoteState) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              duration: const Duration(seconds: 1),
              content: Text(
               S.current.deleteNoteSnackBar,
                textDirection: TextDirection.rtl,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is NoteLoadedState) {
          return const NoteList();
        } else if (state is DeleteNoteState ||
            state is UpdateNoteState ||
            state is SaveNoteState ||
            state is DeleteAllNotesState) {
          return const NoteList();
        } else if (state is NoteLoadingState) {
          return const LinearProgressIndicator();
        } else if (state is NoteError) {
          return Text(S.current.error);
        } else {
          return ElevatedButton(
            onPressed: () {
              BlocProvider.of<TaskBloc>(context).add(TaskInit());
            },
            child: Text(S.current.tryAgain),
          );
        }
      },
    );
  }
}
