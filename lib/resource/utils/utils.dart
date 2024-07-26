part of ' ../../../../index.dart';

Iterable<TaskModel> taskMapTOlist(Box<TaskModel> box) {
  return box.values.map(
    (t) => TaskModel(
     id:  t.id,
      title: t.title,
      note: t.note,
      isCompleted: t.isCompleted,
      date: t.date,
      startTime: t.startTime,
      endTime: t.endTime,
      color: t.color,
      remind: t.remind,
      repeat: t.repeat,
      place: t.place,
    ),
  );
}
  Iterable<NoteModel> noteMapToList(Box<NoteModel> box) {
    return box.values
      .map(
        (n) => NoteModel(
          id: n.id,
          title: n.title,
          description: n.description,
          color: n.color,
          dateTime: n.dateTime,
        ),
      );
  }