part of '../../../index.dart';

class AddTaskScreen extends StatefulWidget {
  final String endTime;
  final String startTime;
  final DateTime date;

  const AddTaskScreen(
      {super.key,
      required this.endTime,
      required this.startTime,
      required this.date});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _selectedDate = DateTime.now();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  String _startTime = "8:30";

  String _endTime = "9:30";

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
    _startTime = widget.startTime;
    _endTime = widget.endTime;
    _selectedDate = widget.date;

    String day = _selectedDate.day.toPersianNumberInt();
    String month = _selectedDate.month.toPersianNumberInt();
    String year = _selectedDate.year.toPersianNumberInt();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'برنامه جدید',
            style: AppTextStyles.appBarTitle,
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputField(
                    title: "عنوان",
                    hint: "عنوان خود را اینجا وارد کنید",
                    controller: titleController,
                    suffixIcon: const Icon(Icons.title),
                  ),
                  InputField(
                    title: "یادداشت",
                    hint: "یادداشت خود را در اینجا وارد کنید",
                    controller: noteController,
                    suffixIcon: const Icon(Icons.note),
                  ),
                  InputField(
                    title: "مکان",
                    hint: "اسم جایی که میخای بری چیه؟",
                    controller: placeController,
                    suffixIcon: const Icon(Icons.pin_drop_rounded),
                  ),
                  InputField(
                    hint: '$day, $month , $year',
                    onTap: () {
                      getDateFromUser();
                    },
                    readOnly: true,
                    suffixIcon: const Icon(Icons.date_range_rounded),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          hint: _startTime,
                          onTap: () {
                            getTimeFromUser(isStartTime: true);
                          },
                          readOnly: true,
                          suffixIcon: const Icon(Icons.timer_rounded),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: InputField(
                          hint: _endTime,
                          readOnly: true,
                          onTap: () {
                            getTimeFromUser(isStartTime: false);
                          },
                          suffixIcon: const Icon(Icons.timer_off_rounded),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppDimens.small),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('هر چند دقیقه یادت بندازم؟'),
                        DropdownButton<String>(
                            value: _selectedRemind.toString(),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            iconSize: 32,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedRemind = int.parse(newValue!);
                              });
                            },
                            items: remindList
                                .map<DropdownMenuItem<String>>((int value) {
                              return DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(value.toString()),
                              );
                            }).toList()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppDimens.small),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('کی به کی یادت بندازم؟'),
                        DropdownButton<String>(
                            value: _selectedRepeat.toString(),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            iconSize: 32,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedRepeat = newValue!;
                              });
                            },
                            items: repeatList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                      ],
                    ),
                  ),
                  AppDimens.medium.height,
                  Padding(
                    padding: const EdgeInsets.all(AppDimens.small),
                    child: Column(
                      children: [
                        const TodoColorSelector(),
                        (AppDimens.large * 7.85).height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: BlocConsumer<TaskBloc, TaskState>(
                                  listener: (context, state) {
                                    if (state is SaveTaskState) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      onPressed: () {
                                        if (titleController.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "please complete all the fields"),
                                            ),
                                          );
                                        } else {
                                          BlocProvider.of<TaskBloc>(context)
                                              .add(
                                            SaveTaskEvent(
                                              TaskModel(
                                                id: '',
                                                title: titleController.text,
                                                note: noteController.text,
                                                place: placeController.text,
                                                isCompleted: 0,
                                                date: _selectedDate,
                                                startTime: _startTime,
                                                endTime: _endTime,
                                                color: _selectedColor,
                                                remind: _selectedRemind,
                                                repeat: _selectedRepeat,
                                              ),
                                            ),
                                          );

                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text(
                                        'ثبت',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
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
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'بیخیال',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  getTimeFromUser({required bool isStartTime}) async {
    var _pickedTime = await _showTimePicker();
    print(_pickedTime.format(context));
    String _formatedTime = _pickedTime.format(context);
    print(_formatedTime);
    if (_pickedTime == null)
      print("time canceld");
    else if (isStartTime)
      setState(() {
        _startTime = _formatedTime;
      });
    else if (!isStartTime) {
      setState(() {
        _endTime = _formatedTime;
      });
      //_compareTime();
    }
  }

  _showTimePicker() async {
    return showTimePicker(
      initialTime: const TimeOfDay(hour: 8, minute: 30),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }

  getDateFromUser() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
