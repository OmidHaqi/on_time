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
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                'یادداشت با موفقیت حذف شد',
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
          return const Text('Error');
        } else {
          return ElevatedButton(
            onPressed: () {
              BlocProvider.of<TaskBloc>(context).add(TaskInit());
            },
            child: const Text('تلاش مجدد'),
          );
        }
      },
    );
  }
}
