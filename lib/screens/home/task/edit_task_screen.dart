part of '../../../index.dart';

class EditTaskScreen extends StatefulWidget {
  final TaskModel taskModel;
  const EditTaskScreen({super.key, required this.taskModel});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late DateTime _selectedDate;
  late DateTime _persianSelectedDate;
  late TaskColor _taskSelectedColor;
  late TextEditingController _titleController;
  late TextEditingController _noteController;
  late bool addToNote;
  bool editNote = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.taskModel.dateTime;
    _taskSelectedColor = widget.taskModel.color;
    _persianSelectedDate = widget.taskModel.dateTime;
    _titleController = TextEditingController(text: widget.taskModel.title);
    _noteController = TextEditingController(text: widget.taskModel.note);
    addToNote = widget.taskModel.addToNote;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var taskList = widget.taskModel;

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

    var lang = BlocProvider.of<SettingsBloc>(context).state.locale.languageCode;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(_taskSelectedColor.code),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Color(_taskSelectedColor.code),
          title: Text(
            S.current.editTask,
            style: AppTextStyles.appBarTitle
                .apply(color: AppColors.appPrimaryDark),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.small),
                child: ListView(
                  children: [
                    InputField(
                      title: S.current.taskTitle,
                      hint: S.current.taskTitleHint,
                      controller: _titleController,
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
                      controller: _noteController,
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
                          Text(S.current.addToNote,
                              style: const TextStyle(
                                  color: AppColors.appPrimaryDark)),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.current.editNote,
                            style: const TextStyle(
                              color: AppColors.appPrimaryDark,
                            ),
                          ),
                          Theme(
                            data:AppTheme.lightTheme(context),
                            child: Checkbox(
                              value: editNote,
                              onChanged: (val) {
                                setState(() {
                                  editNote = val!;
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
            Padding(
              padding: const EdgeInsets.only(right: AppDimens.small),
              child: Column(
                children: [
                  TaskColorSelector(
                    selectedColor: _taskSelectedColor,
                    onColorSelected: (value) {
                      setState(() {
                        _taskSelectedColor = value;
                      });
                    },
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
                                      duration:
                                          const Duration(milliseconds: 500),
                                      content: Text(
                                        S.current.editTaskSnackBar,
                                      ),
                                    ),
                                  );
                                  NotificationHelper.scheduleNotification(
                                    0,
                                    _titleController.text,
                                    _noteController.text,
                                    _selectedDate,
                                  );
                                } else if (state is DeleteTaskState) {
                                  NotificationHelper.cancelNotification(0);
                                }
                              },
                              builder: (context, state) {
                                return TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      AppColors.appPrimaryDark,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_titleController.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            S.current.emptyTextFieldError,
                                          ),
                                        ),
                                      );
                                    } else {
                                      if (lang == 'fa') {
                                        if (editNote) {
                                          String dateTime =
                                              '${DateTime.now().hour.toPersianNumberInt()}:${DateTime.now().minute.toPersianNumberInt()} / ${Jalali.now().day.toPersianNumberInt()} - ${Jalali.now().month.toPesianMonth()} ';
                                          BlocProvider.of<NoteBloc>(context)
                                              .add(UpdateNoteEvent(
                                                  NoteModel(
                                                    id: taskList.id,
                                                    title:
                                                        _titleController.text,
                                                    description:
                                                        _noteController.text,
                                                    color: _noteSelectedColor,
                                                    dateTime: dateTime,
                                                  ),
                                                  taskList.id));
                                        }
                                        if (addToNote == false) {
                                          BlocProvider.of<NoteBloc>(context)
                                              .add(
                                            DeleteNoteEvent(
                                              taskList.id,
                                            ),
                                          );
                                        }
                                        BlocProvider.of<TaskBloc>(context).add(
                                          UpdateTaskEvent(
                                            TaskModel(
                                              id: taskList.id,
                                              title: _titleController.text,
                                              note: _noteController.text,
                                              addToNote: addToNote,
                                              isCompleted: false,
                                              dateTime: _persianSelectedDate,
                                              color: _taskSelectedColor,
                                            ),
                                            taskList.id,
                                          ),
                                        );
                                      } else {
                                        if (editNote) {
                                          String gDateTime =
                                              '${DateTime.now().hour}:${DateTime.now().minute} / ${DateTime.now().day} - ${DateTime.now().month.toGregorianMonth()} ';
                                          BlocProvider.of<NoteBloc>(context)
                                              .add(UpdateNoteEvent(
                                                  NoteModel(
                                                    id: taskList.id,
                                                    title:
                                                        _titleController.text,
                                                    description:
                                                        _noteController.text,
                                                    color: _noteSelectedColor,
                                                    dateTime: gDateTime,
                                                  ),
                                                  taskList.id));
                                        }
                                        if (addToNote == false) {
                                          BlocProvider.of<NoteBloc>(context)
                                              .add(
                                            DeleteNoteEvent(
                                              taskList.id,
                                            ),
                                          );
                                        }
                                        BlocProvider.of<TaskBloc>(context).add(
                                          UpdateTaskEvent(
                                            TaskModel(
                                              id: taskList.id,
                                              title: _titleController.text,
                                              note: _noteController.text,
                                              addToNote: addToNote,
                                              isCompleted: false,
                                              dateTime: _selectedDate,
                                              color: _taskSelectedColor,
                                            ),
                                            taskList.id,
                                          ),
                                        );
                                      }

                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Text(
                                    S.current.save,
                                    style: const TextStyle(
                                      color: AppColors.appOnPrimaryDark,
                                    ),
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
                                  AppColors.appPrimaryDark,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                S.current.discard,
                                style: const TextStyle(
                                  color: AppColors.appOnPrimaryDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface // تنظیم اندازه‌ی فونت در اینجا
                          ),
                    ),
                  ),
                  child: PCupertinoDatePicker(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    initialDateTime: widget.taskModel.dateTime.toJalali(),
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
                    initialDateTime: widget.taskModel.dateTime,
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
