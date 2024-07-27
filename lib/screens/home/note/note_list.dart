part of '../../../index.dart';

class NoteList extends StatelessWidget {
  final bool darkModeOn;
  const NoteList({
    super.key,
    required this.darkModeOn,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 714,
      child: ValueListenableBuilder<Box<NoteModel>>(
        valueListenable: noteBox.listenable(),
        builder: (contxt, builderNotesBox, _) {
          final notesList = builderNotesBox.values.toList();
          if (notesList.isEmpty) {
            return EmptyVC(
              darkModeOn: darkModeOn,
              text: 'هنوز یادداشتی اضافه نکردی',
            );
          } else {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: MasonryGridView.count(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                crossAxisCount: 2,
                itemCount: notesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return NoteCard(
                    note: notesList[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => EditNoteScreen(
                            note: NoteModel(
                              id: notesList[index].id,
                              title: notesList[index].title,
                              description: notesList[index].description,
                              color: notesList[index].color,
                              dateTime: notesList[index].dateTime,
                            ),
                          ),
                        ),
                      );
                    },
                    onLongPress: () {
                      BlocProvider.of<NoteBloc>(context)
                          .add(DeleteNoteEvent(notesList[index].id));
                    },
                  )
                      .animate()
                      .fadeIn(delay: 100.ms * index)
                      .moveX(delay: 100.ms * index);
                },
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
              ),
            );
          }
        },
      ),
    );
  }
}
