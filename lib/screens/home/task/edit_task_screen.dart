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
  late TextEditingController _placeController;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.taskModel.dateTime;
    _taskSelectedColor = widget.taskModel.color;
    _persianSelectedDate = widget.taskModel.dateTime;
    _titleController = TextEditingController(text: widget.taskModel.title);
    _noteController = TextEditingController(text: widget.taskModel.note);
    _placeController = TextEditingController(text: widget.taskModel.place);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _placeController.dispose();
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

    var datePickerThemeEn = picker.DatePickerTheme(
        backgroundColor: Theme.of(context).colorScheme.surface,
        itemStyle: TextStyle(
            fontFamily: 'Ubuntu',
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 18),
        cancelStyle: TextStyle(
            fontFamily: 'Ubuntu',
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16),
        doneStyle: TextStyle(
            fontFamily: 'Ubuntu',
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16));
    var datePickerThemeFa = picker.DatePickerTheme(
        backgroundColor: Theme.of(context).colorScheme.surface,
        itemStyle: TextStyle(
            fontFamily: 'YekanBakhNumFa',
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 18),
        cancelStyle: TextStyle(
            fontFamily: 'YekanBakhNumFa',
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16),
        doneStyle: TextStyle(
            fontFamily: 'YekanBakhNumFa',
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16));

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
                    InputField(
                      title: S.current.taskNoteTitle,
                      hint: S.current.taskNoteHint,
                      controller: _noteController,
                      suffixIcon: const Icon(
                        Icons.note,
                        color: AppColors.appPrimaryDark,
                      ),
                    ),
                    InputField(
                      title: S.current.taskPlaceTitle,
                      hint: S.current.taskPlaceHint,
                      controller: _placeController,
                      suffixIcon: const Icon(
                        Icons.pin_drop_rounded,
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
                            onTap: () {
                              if (lang == 'fa') {
                                picker.DatePicker.showDateTimePicker(
                                  context,
                                  showTitleActions: true,
                                  theme: datePickerThemeFa,
                                  onConfirm: (date) {
                                    setState(() {
                                      _persianSelectedDate = date;
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                  locale: picker.LocaleType.fa,
                                );
                              } else {
                                picker.DatePicker.showDateTimePicker(
                                  context,
                                  showTitleActions: true,
                                  theme: datePickerThemeEn,
                                  onConfirm: (date) {
                                    setState(() {
                                      _selectedDate = date;
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                );
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
                                        BlocProvider.of<TaskBloc>(context).add(
                                          UpdateTaskEvent(
                                            TaskModel(
                                              id: taskList.id,
                                              title: _titleController.text,
                                              note: _noteController.text,
                                              place: _placeController.text,
                                              isCompleted: false,
                                              dateTime: _persianSelectedDate,
                                              color: _taskSelectedColor,
                                            ),
                                            taskList.id,
                                          ),
                                        );
                                      } else {
                                        BlocProvider.of<TaskBloc>(context).add(
                                          UpdateTaskEvent(
                                            TaskModel(
                                              id: taskList.id,
                                              title: _titleController.text,
                                              note: _noteController.text,
                                              place: _placeController.text,
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
}
