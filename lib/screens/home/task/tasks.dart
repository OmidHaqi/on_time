// Tasks.dart

part of '../../../index.dart';

Box<TaskModel> box = Hive.box<TaskModel>(taskBoxName);

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final todoList = box.values.toList();

    final taskDates = todoList
        .map((task) => DateTime(task.date.year, task.date.month, task.date.day))
        .toSet()
        .toList();

    final darkModeOn =
        BlocProvider.of<ThemeBloc>(context).state == ThemeMode.dark;

    String day = _selectedDate.toJalali().day.toPersianNumberInt();
    String month = _selectedDate.toJalali().month.toPesianMonth();
    String year = _selectedDate.toJalali().year.toPersianNumberInt();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: AppDimens.medium),
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
          child: Text(
            ' $day, $month , $year',
            style: AppTextStyles.appTopText,
            textDirection: TextDirection.rtl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: PersianHorizontalDatePicker(
            selectedMarkedDotColor: Theme.of(context).colorScheme.surface,
            markedDotColor: Theme.of(context).colorScheme.onSurface,
            markedDates: taskDates,
            hasSelectedItemShadow: false,
            initialSelectedDate: DateTime.now(),
            datePickerHeight: 90,
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 30)),
            backgroundColor: Colors.transparent,
            textColor: Theme.of(context).colorScheme.onSurface,
            selectedTextColor: Theme.of(context).colorScheme.surface,
            selectedBackgroundColor: Theme.of(context).colorScheme.onSurface,
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date!;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
              child: IconButton.filled(
                iconSize: 35,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => AddTaskScreen(
                        taskModel: TaskModel(
                          id: 0,
                          title: '',
                          note: '',
                          isCompleted: 0,
                          date: _selectedDate,
                          startTime: '08:30',
                          endTime: '12:30',
                          color: TaskColor.one,
                          remind: 5,
                          repeat: 'هیچ کدام',
                          place: '',
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimens.medium),
              child: InkWell(
                onTap: () {
                  BlocProvider.of<TaskBloc>(context).add(DeleteAllTasksEvent());
                },
                child: Text(
                  AppStrings.planning,
                  style: AppTextStyles.bodyTitleTextStyle.apply(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
        BlocConsumer<TaskBloc, TaskState>(
          listener: (context, state) {
            if (state is DeleteTaskState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('task Delete'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is TaskLoadedState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
                colorCode: _selectedColor.code,
                selectedDate: _selectedDate,
              );
            } else if (state is DeleteAllTasksState ||
                state is DeleteTaskState ||
                state is SaveTaskState ||
                state is UpdateTaskState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
                colorCode: _selectedColor.code,
                selectedDate: _selectedDate,
              );
            } else if (state is TaskError) {
              return const Text('ERROR');
            } else if (state is TaskLoadingState) {
              return const LinearProgressIndicator();
            } else {
              return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<TaskBloc>(context).add(TaskInit());
                },
                child: const Text('تلاش مجدد'),
              );
            }
          },
        ),
      ],
    );
  }
}
