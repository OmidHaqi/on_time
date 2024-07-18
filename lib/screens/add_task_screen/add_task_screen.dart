import 'package:flutter/material.dart';
import 'package:on_time/resource/app_dimens.dart';
import 'package:on_time/resource/components/text_style.dart';
import 'package:on_time/resource/utils/extensions.dart';
import 'package:on_time/resource/widgets/input_feild.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Jalali _selectedDate = Jalali.now();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();

  final TextEditingController _placeController = TextEditingController();

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

  String _selectedRepeat = 'هیچ کدام';

  List<String> repeatList = [
    'هیچ کدام',
    'هر روز',
    'هر هفته',
    'هر ماه',
  ];

  @override
  Widget build(BuildContext context) {
    String day = _selectedDate.day.toPersianNumberInt();
    String month = _selectedDate.month.toPesianMonth();
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(
                    title: "عنوان",
                    hint: "عنوان خود را اینجا وارد کنید",
                    controller: _titleController,
                    suffixIcon: const Icon(Icons.title),
                  ),
                  InputField(
                    title: "یادداشت",
                    hint: "یادداشت خود را در اینجا وارد کنید",
                    controller: _noteController,
                    suffixIcon: const Icon(Icons.note),
                  ),
                  InputField(
                    title: "مکان",
                    hint: "اسم جایی که میخای بری چیه؟",
                    controller: _placeController,
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
                              'ثبت',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
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
      ),
    );
  }

  colorChips() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "رنگ",
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

    String formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
    } else if (isStartTime) {
      setState(() {
        _startTime = formatedTime;
      });
    } else if (!isStartTime) {
      setState(() {
        _endTime = formatedTime;
      });
      //_compareTime();
    }
  }

  _showTimePicker() async {
    return showPersianTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 8, minute: 30),
      initialEntryMode: PTimePickerEntryMode.input,
    );
  }

  getDateFromUser() async {

    final Jalali? pickedDate = await showPersianDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: Jalali(1310),
      lastDate: Jalali(1500),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
