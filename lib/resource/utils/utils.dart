part of ' ../../../../index.dart';

Iterable<TaskModel> taskMapTOlist(Box<TaskModel> box) {
  return box.values.map(
    (t) => TaskModel(
      id: t.id,
      title: t.title,
      note: t.note,
      isCompleted: t.isCompleted,
      dateTime: t.dateTime,
      color: t.color,
      addToNote: t.addToNote
    ),
  );
}

Iterable<NoteModel> noteMapToList(Box<NoteModel> box) {
  return box.values.map(
    (n) => NoteModel(
      id: n.id,
      title: n.title,
      description: n.description,
      color: n.color,
      dateTime: n.dateTime,
    ),
  );
}

class IsFirstRun {
  static const _firstRunSettingsKey = 'is_first_run';
  static const _firstCallSettingsKey = 'is_first_call';

  static bool? _isFirstRun;

  static Future<bool> isFirstCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstCall;
    try {
      firstCall = prefs.getBool(_firstCallSettingsKey) ?? true;
    } on Exception {
      firstCall = true;
    }
    await prefs.setBool(_firstCallSettingsKey, false);
    return firstCall;
  }

  static Future<bool> isFirstRun() async {
    if (_isFirstRun != null) {
      return _isFirstRun!;
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isFirstRun;
      try {
        isFirstRun = prefs.getBool(_firstRunSettingsKey) ?? true;
      } on Exception {
        isFirstRun = true;
      }
      await prefs.setBool(_firstRunSettingsKey, false);
      _isFirstRun ??= isFirstRun;
      return isFirstRun;
    }
  }

  static Future<void> reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_firstRunSettingsKey, true);
    prefs.setBool(_firstCallSettingsKey, true);
  }
}
