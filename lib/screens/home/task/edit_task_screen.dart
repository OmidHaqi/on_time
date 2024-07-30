part of '../../../index.dart';

class EditTaskScreen extends StatefulWidget {
  final TaskModel taskModel;
  const EditTaskScreen({super.key, required this.taskModel});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late Jalali _selectedDate;
  late String _startTime;
  late TaskColor _taskSelectedColor;

  @override
  void initState() {
    super.initState();
    // Initialize the state variables with the taskModel values
    _selectedDate = widget.taskModel.date.toJalali();
    _startTime = widget.taskModel.startTime;
    _taskSelectedColor = widget.taskModel.color;
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: InputField(
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
                                              remind: 0,
                                              repeat: '',
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

  Future<void> getDateFromUser() async {
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
