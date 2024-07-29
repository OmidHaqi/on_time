part of '../../../index.dart';

class EditTaskScreen extends StatefulWidget {
  final TaskModel taskModel;
  const EditTaskScreen({super.key, required this.taskModel});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  Jalali _selectedDate = Jalali.now();

  String _startTime = "";

  int _selectedRemind = 5;

  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  String _selectedRepeat = 'هیچ کدام';

  List<String> repeatList = [
    'هیچ کدام',
    'هر روز',
    'هر هفته',
    'هر ماه',
  ];

  @override
  Widget build(BuildContext context) {
    var taskList = widget.taskModel;
    final TextEditingController titleController =
        TextEditingController(text: taskList.title);
    final TextEditingController noteController =
        TextEditingController(text: taskList.note);
    final TextEditingController placeController =
        TextEditingController(text: taskList.place);
    _selectedDate = taskList.date.toJalali();
    _selectedRemind = taskList.remind;
    _selectedRepeat = taskList.repeat;
    _startTime = taskList.startTime;
    _taskSelectedColor = taskList.color;

    String day = _selectedDate.day.toPersianNumberInt();
    String month = _selectedDate.month.toPersianNumberInt();
    String year = _selectedDate.year.toPersianNumberInt();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(taskList.color.code),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Color(taskList.color.code),
          title: Text(
            ' ویرایش برنامه ',
            style: AppTextStyles.appBarTitle
                .apply(color: AppColors.appPrimaryDark),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppDimens.small),
                  child: ListView(
                    children: [
                      InputField(
                        title: "عنوان",
                        hint: "عنوان خود را اینجا وارد کنید",
                        controller: titleController,
                        suffixIcon: const Icon(
                          Icons.title,
                          color: AppColors.appPrimaryDark,
                        ),
                      ),
                      InputField(
                        title: "یادداشت",
                        hint: "یادداشت خود را در اینجا وارد کنید",
                        controller: noteController,
                        suffixIcon: const Icon(
                          Icons.note,
                          color: AppColors.appPrimaryDark,
                        ),
                      ),
                      InputField(
                        title: "مکان",
                        hint: "اسم جایی که میخای بری چیه؟",
                        controller: placeController,
                        suffixIcon: const Icon(
                          Icons.pin_drop_rounded,
                          color: AppColors.appPrimaryDark,
                        ),
                      ),
                      InputField(
                        hint: '$day, $month , $year',
                        onTap: () {
                          getDateFromUser();
                        },
                        readOnly: true,
                        suffixIcon: const Icon(
                          Icons.date_range_rounded,
                          color: AppColors.appPrimaryDark,
                        ),
                      ),
                      InputField(
                        hint: _startTime == '' ? 'ساعت' : _startTime,
                        onTap: () {
                          getTimeFromUser(isStartTime: true);
                        },
                        readOnly: true,
                        suffixIcon: const Icon(
                          Icons.timer_rounded,
                          color: AppColors.appPrimaryDark,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppDimens.small),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'هر چند دقیقه یادت بندازم؟',
                              style: TextStyle(
                                color: AppColors.appPrimaryDark,
                              ),
                            ),
                            DropdownButton<String>(
                              value: _selectedRemind.toString(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.appPrimaryDark,
                              ),
                              iconSize: 32,
                              onChanged: (String? newValue) => setState(
                                () => _selectedRemind = int.parse(
                                  newValue!,
                                ),
                              ),
                              items: remindList
                                  .map<DropdownMenuItem<String>>((int value) {
                                return DropdownMenuItem<String>(
                                  value: value.toString(),
                                  child: Text(
                                    value.toString(),
                                    style: const TextStyle(
                                      color: AppColors.appPrimaryDark,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppDimens.small),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'کی به کی یادت بندازم؟',
                              style: TextStyle(
                                color: AppColors.appPrimaryDark,
                              ),
                            ),
                            DropdownButton<String>(
                              value: _selectedRepeat.toString(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.appPrimaryDark,
                              ),
                              iconSize: 32,
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    _selectedRepeat = newValue!;
                                  },
                                );
                              },
                              items: repeatList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      color: AppColors.appPrimaryDark,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: AppDimens.small),
                child: Column(
                  children: [
                    const TodoColorSelector(),
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
                                      const SnackBar(
                                        duration: Duration(milliseconds: 500),
                                        content: Text(
                                          'Add Task',
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
                                          const SnackBar(
                                            content: Text(
                                              "please complete all the fields",
                                            ),
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
                                              date: _selectedDate.toDateTime(),
                                              startTime: _startTime,
                                              endTime: '',
                                              color: _taskSelectedColor,
                                              remind: _selectedRemind,
                                              repeat: _selectedRepeat,
                                            ),
                                            taskList.id,
                                          ),
                                        );

                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text(
                                      'ثبت',
                                      style: TextStyle(
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
                                child: const Text(
                                  'بیخیال',
                                  style: TextStyle(
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
      ),
    );
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
  Future<void> getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await showPersianTimePicker(
      initialEntryMode: PTimePickerEntryMode.dialOnly,
      initialTime: const TimeOfDay(hour: 8, minute: 30),
      context: context,
    );

    if (pickedTime == null) {
      return;
    }

    // Ensure the widget is still mounted before accessing context
    if (!mounted) return;

    String formattedTime = pickedTime.format(context);

    setState(() {
      if (isStartTime) {
        _startTime = formattedTime;
      }
    });
  }

  getDateFromUser() async {
    final Jalali? pickedDate = await showPersianDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: Jalali(1300),
      lastDate: Jalali(1500),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
