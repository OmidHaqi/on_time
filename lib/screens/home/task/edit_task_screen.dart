part of '../../../index.dart';

class EditTaskScreen extends StatefulWidget {
  final TaskModel taskModel;
  const EditTaskScreen({super.key, required this.taskModel});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late DateTime _selectedDate;
  late Jalali _persianSelectedDate;
  late String _startTime;
  late TaskColor _taskSelectedColor;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.taskModel.date;
    _startTime = widget.taskModel.startTime;
    _taskSelectedColor = widget.taskModel.color;
    _persianSelectedDate = widget.taskModel.date.toJalali();
  }

  @override
  Widget build(BuildContext context) {
    var taskList = widget.taskModel;
    final TextEditingController titleController =
        TextEditingController(text: taskList.title);
    final TextEditingController noteController =
        TextEditingController(text: taskList.note);
    final TextEditingController placeController =
        TextEditingController(text: taskList.place);

    String persianDay = _persianSelectedDate.day.toPersianNumberInt();
    String perianMonth = _persianSelectedDate.month.toPesianMonth();
    String persianYear = _persianSelectedDate.year.toPersianNumberInt();

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
                      controller: titleController,
                      suffixIcon: const Icon(
                        Icons.title,
                        color: AppColors.appPrimaryDark,
                      ),
                    ),
                    InputField(
                      title: S.current.taskNoteTitle,
                      hint: S.current.taskNoteHint,
                      controller: noteController,
                      suffixIcon: const Icon(
                        Icons.note,
                        color: AppColors.appPrimaryDark,
                      ),
                    ),
                    InputField(
                      title: S.current.taskPlaceTitle,
                      hint: S.current.taskPlaceHint,
                      controller: placeController,
                      suffixIcon: const Icon(
                        Icons.pin_drop_rounded,
                        color: AppColors.appPrimaryDark,
                      ),
                    ),
                    InputField(
                      hint: lang == 'fa'
                          ? '$persianDay, $perianMonth , $persianYear'
                          : '$gregorianDay, $gregorianMonth , $gregorianYear',
                      onTap: () {
                        if (lang == 'fa') {
                          getPersianDateFromUser();
                        } else {
                          getGregorianDateFromUser();
                        }
                      },
                      readOnly: true,
                      suffixIcon: const Icon(
                        Icons.date_range_rounded,
                        color: AppColors.appPrimaryDark,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: InputField(
                            hint:
                                _startTime == '' ? S.current.time : _startTime,
                            onTap: () {
                              if (lang == 'fa') {
                                getPersianTimeFromUser(isStartTime: true);
                              } else {
                                getGregorianTimeFromUser(isStartTime: true);
                              }
                            },
                            readOnly: true,
                            suffixIcon: const Icon(
                              Icons.timer_rounded,
                              color: AppColors.appPrimaryDark,
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 35,
                          onPressed: () {
                            setState(() {
                              _startTime = '';
                            });
                          },
                          icon: const Icon(
                            Icons.delete_outline_rounded,
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
                                    if (titleController.text.isEmpty) {
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
                                              title: titleController.text,
                                              note: noteController.text,
                                              place: placeController.text,
                                              isCompleted: false,
                                              date: _persianSelectedDate
                                                  .toDateTime(),
                                              startTime: _startTime,
                                              endTime: '',
                                              color: _taskSelectedColor,
                                              remind: 0,
                                              repeat: '',
                                            ),
                                            taskList.id,
                                          ),
                                        );
                                      } else {
                                        BlocProvider.of<TaskBloc>(context).add(
                                          UpdateTaskEvent(
                                            TaskModel(
                                              id: taskList.id,
                                              title: titleController.text,
                                              note: noteController.text,
                                              place: placeController.text,
                                              isCompleted: false,
                                              date: _selectedDate,
                                              startTime: _startTime,
                                              endTime: '',
                                              color: _taskSelectedColor,
                                              remind: 0,
                                              repeat: '',
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

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  Future<void> getPersianTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await showPersianTimePicker(
      initialEntryMode: PTimePickerEntryMode.dialOnly,
      initialTime: const TimeOfDay(hour: 8, minute: 30),
      context: context,
    );

    // Ensure the widget is still mounted before accessing context
    if (!mounted) return;

    if (pickedTime != null) {
      String formattedTime = pickedTime.format(context);
      setState(() {
        if (isStartTime) {
          _startTime = formattedTime;
        }
      });
    }
  }

  Future<void> getGregorianTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dialOnly,
      initialTime: const TimeOfDay(hour: 8, minute: 30),
      context: context,
    );

    // Ensure the widget is still mounted before accessing context
    if (!mounted) return;

    if (pickedTime != null) {
      String formattedTime = pickedTime.format(context);
      setState(() {
        if (isStartTime) {
          _startTime = formattedTime;
        }
      });
    }
  }

  Future<void> getPersianDateFromUser() async {
    final Jalali? pickedDate = await showPersianDatePicker(
      context: context,
      initialDate: _persianSelectedDate,
      firstDate: Jalali(1300),
      lastDate: Jalali(1500),
    );

    if (pickedDate != null) {
      setState(() {
        _persianSelectedDate = pickedDate;
      });
    }
  }

  Future<void> getGregorianDateFromUser() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
