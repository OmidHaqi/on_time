import 'package:flutter/material.dart';
import 'package:on_time/resource/app_dimens.dart';
import 'package:on_time/resource/components/text_style.dart';
import 'package:on_time/resource/widgets/input_feild.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _selectedDate = DateTime.parse(DateTime.now().toString());

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();

  String _startTime = "8:30 AM";

  String _endTime = "9:30 AM";

  int _selectedColor = 0;

  int _selectedRemind = 5;

  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  String _selectedRepeat = 'None';

  List<String> repeatList = [
    'None',
    'Daily',
    'Weekly',
    'Monthly',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Add Task',
            style: AppTextStyles.appBarTitle,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  title: "Title",
                  hint: "Enter title here.",
                  controller: _titleController,
                  suffixIcon: const Icon(Icons.title),
                ),
                InputField(
                  title: "Note",
                  hint: "Enter note here.",
                  controller: _noteController,
                  suffixIcon: const Icon(Icons.note),
                ),
                InputField(
                  title: "Date",
                  hint: "Pick Date here",
                  suffixIcon: const Icon(Icons.date_range_rounded),
                  widget: IconButton(
                    icon: (const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    )),
                    onPressed: () {
                      //showDatePicker(context);
                      getDateFromUser();
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        title: "Start Time",
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
                        title: "End Time",
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
                      const Text('هر چند دقیقه یادت بندازم؟'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      const Text('کی به کی یادت بندازم؟'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.small),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      colorChips(),
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Create Task',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  colorChips() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Color",
      ),
      const SizedBox(
        height: 8,
      ),
      Wrap(
        children: List<Widget>.generate(
          3,
          (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? Theme.of(context).colorScheme.primary
                      : index == 1
                          ? Colors.pink
                          : Colors.yellow,
                  child: index == _selectedColor
                      ? const Center(
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 18,
                          ),
                        )
                      : Container(),
                ),
              ),
            );
          },
        ).toList(),
      ),
    ]);
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    print(pickedTime.format(context));
    String formatedTime = pickedTime.format(context);
    print(formatedTime);
    if (pickedTime == null) {
      print("time canceld");
    } else if (isStartTime)
      setState(() {
        _startTime = formatedTime;
      });
    else if (!isStartTime) {
      setState(() {
        _endTime = formatedTime;
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
