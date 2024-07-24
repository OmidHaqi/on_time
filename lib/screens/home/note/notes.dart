part of '../../../../../index.dart';

Box<NoteModel> noteBox = Hive.box<NoteModel>(noteBoxName);

class Notes extends StatelessWidget {
  const Notes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Note');
  }
}
