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
  final TextEditingController placeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.date;
    _persianSelectedDate = widget.date;
  }

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
                                  currentTime: _persianSelectedDate,
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
                                  currentTime: _selectedDate,
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
                                            id: 0,
                                            title: titleController.text,
                                            note: noteController.text,
                                            place: placeController.text,
                                            isCompleted: false,
                                            dateTime: _persianSelectedDate,
                                            color: _taskSelectedColor,
                                          ),
                                        ),
                                      );
                                    } else {
                                      BlocProvider.of<TaskBloc>(context).add(
                                        SaveTaskEvent(
                                          TaskModel(
                                            id: 0,
                                            title: titleController.text,
                                            note: noteController.text,
                                            place: placeController.text,
                                            isCompleted: false,
                                            dateTime: _selectedDate,
                                            color: _taskSelectedColor,
                                          ),
                                        ),
                                      );
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
}
