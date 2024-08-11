part of '../../../index.dart';

class AddTaskScreen extends StatefulWidget {
  final DateTime date;
  const AddTaskScreen({super.key, required this.date});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late DateTime _selectedDate;
  late DateTime _persianSelectedDate;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.date;
    _persianSelectedDate = widget.date;
  }

  bool addToNote = false;
  
  @override
  Widget build(BuildContext context) {
    String persianDay =
        _persianSelectedDate.toJalali().day.toPersianNumberInt();
    String perianMonth = _persianSelectedDate.toJalali().month.toPesianMonth();
    String persianYear =
        _persianSelectedDate.toJalali().year.toPersianNumberInt();
    String persianMinute = _persianSelectedDate.minute.toString();
    String persianHour = _persianSelectedDate.hour.toString();

    String gregorianMinute = _selectedDate.minute.toString();
    String gregorianHour = _selectedDate.hour.toString();

    String gregorianDay = _selectedDate.day.toString();
    String gregorianMonth = _selectedDate.month.toGregorianMonth();
    String gregorianYear = _selectedDate.year.toString();
      var uuid = const Uuid();
    String uuidString = uuid.v4();
    List<int> bytes = utf8.encode(uuidString);
    int taskId = bytes.fold(0, (previousValue, element) {
      return previousValue + element;
    });
    var lang = BlocProvider.of<SettingsBloc>(context).state.locale.languageCode;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(_taskSelectedColor.code),
        appBar: AppBar(
          backgroundColor: Color(_taskSelectedColor.code),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            S.current.newTask,
            style: AppTextStyles.appBarTitle
                .apply(color: AppColors.appPrimaryDark),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.small),
                child: ListView(
                  children: [
                    InputField(
                      title: S.current.taskTitle,
                      hint: S.current.taskTitleHint,
                      controller: titleController,
                      suffixIcon: const Icon(
                        Icons.title,
                        color: AppColors.appPrimaryDark,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: InputField(
                            hint: lang == 'fa'
                                ? '$persianMinute : $persianHour  | $persianDay, $perianMonth , $persianYear'
                                : '$gregorianHour : $gregorianMinute |  $gregorianDay, $gregorianMonth , $gregorianYear',
                            onTap: () async {
                              if (lang == 'fa') {
                                await persianDateTimePicker(context);
                              } else {
                                await gregorianDateTimePicker(context);
                              }
                            },
                            readOnly: true,
                            suffixIcon: const Icon(
                              Icons.calendar_month,
                              color: AppColors.appPrimaryDark,
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 35,
                          onPressed: () {
                            setState(() {
                              if (lang == 'fa') {
                                _persianSelectedDate = DateTime.now();
                              } else {
                                _selectedDate = DateTime.now();
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.today,
                            color: AppColors.appPrimaryDark,
                          ),
                        )
                      ],
                    ),
                    InputField(
                      title: S.current.taskNoteTitle,
                      hint: S.current.taskNoteHint,
                      controller: noteController,
                      maxLines: 40,
                      minLines: 3,
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.topCenter,
                          widthFactor: 1.0,
                          heightFactor: 10.0,
                          child: Icon(
                            Icons.note,
                            color: AppColors.appPrimaryDark,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(S.current.addToNote , style:const TextStyle(color: AppColors.appPrimaryDark),),
                          Theme(
                            data: AppTheme.lightTheme(context),
                            child: Checkbox(
                              value: addToNote,
                              onChanged: (val) {
                                setState(() {
                                  addToNote = val!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppDimens.small),
                  child: TaskColorSelector(
                    selectedColor: _taskSelectedColor,
                    onColorSelected: (value) {
                      setState(() {
                        _taskSelectedColor = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.small),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: BlocConsumer<TaskBloc, TaskState>(
                            listener: (context, state) {
                              if (state is SaveTaskState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      S.current.addTaskSnackBar,
                                    ),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return TextButton(
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppColors.appPrimaryDark),
                                ),
                                onPressed: () {
                                  if (titleController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          S.current.emptyTextFieldError,
                                        ),
                                      ),
                                    );
                                  } else {
                                    if (lang == 'fa') {
                                      BlocProvider.of<TaskBloc>(context).add(
                                        SaveTaskEvent(
                                          TaskModel(
                                            id: taskId,
                                            title: titleController.text,
                                            note: noteController.text,
                                            addToNote: addToNote,
                                            isCompleted: false,
                                            dateTime: _persianSelectedDate,
                                            color: _taskSelectedColor,
                                          ),
                                        ),
                                      );
                                      if (addToNote) {
                                        String dateTime =
                                            '${DateTime.now().hour.toPersianNumberInt()}:${DateTime.now().minute.toPersianNumberInt()} / ${Jalali.now().day.toPersianNumberInt()} - ${Jalali.now().month.toPesianMonth()} ';
                                        BlocProvider.of<NoteBloc>(context).add(
                                          SaveNoteEvent(
                                            NoteModel(
                                                id: taskId,
                                                title: titleController.text,
                                                description:
                                                    noteController.text,
                                                color: _noteSelectedColor,
                                                dateTime: dateTime),
                                          ),
                                          
                                        );
                                      }
                                    } else {
                                      BlocProvider.of<TaskBloc>(context).add(
                                        SaveTaskEvent(
                                          TaskModel(
                                            id: taskId,
                                            title: titleController.text,
                                            note: noteController.text,
                                            addToNote: false,
                                            isCompleted: false,
                                            dateTime: _selectedDate,
                                            color: _taskSelectedColor,
                                          ),
                                        ),
                                      );
                                      if (addToNote) {
                                        String gDateTime =
                                            '${DateTime.now().hour}:${DateTime.now().minute} / ${DateTime.now().day} - ${DateTime.now().month.toGregorianMonth()} ';
                                        BlocProvider.of<NoteBloc>(context).add(
                                          SaveNoteEvent(
                                            NoteModel(
                                                id: taskId,
                                                title: titleController.text,
                                                description:
                                                    noteController.text,
                                                color: _noteSelectedColor,
                                                dateTime: gDateTime),
                                          ),
                                        );
                                      }
                                    }

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  S.current.save,
                                  style: const TextStyle(
                                      color: AppColors.appOnPrimaryDark),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      AppDimens.small.width,
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  AppColors.appPrimaryDark),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              S.current.discard,
                              style: const TextStyle(
                                  color: AppColors.appOnPrimaryDark),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> persianDateTimePicker(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 250,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'لغو',
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'تایید',
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                          fontFamily: 'YekanBakhNumFa',
                          fontSize: 18.0,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                  child: PCupertinoDatePicker(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    initialDateTime: Jalali.now(),
                    use24hFormat: true,
                    mode: PCupertinoDatePickerMode.dateAndTime,
                    onDateTimeChanged: (dateTime) {
                      setState(() {
                        _persianSelectedDate = dateTime.toDateTime();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> gregorianDateTimePicker(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'Dissmis',
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Done',
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 18.0,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    initialDateTime: DateTime.now(),
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    onDateTimeChanged: (dateTime) {
                      setState(() {
                        _selectedDate = dateTime;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
