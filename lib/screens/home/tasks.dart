part of '../../index.dart';

Box<TaskModel> box = Hive.box<TaskModel>(taskBoxName);

class Tasks extends StatefulWidget {
  const Tasks({
    super.key,
  });

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime _selectedDate = DateTime.parse(DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    final todoList = box.values.toList();

    final taskDates = todoList
        .map((task) {
          return DateTime(task.date.year, task.date.month, task.date.day);
        })
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
                            date: DateTime.now(),
                            startTime: '',
                            endTime: '',
                            color: TodoColor.one,
                            remind: 0,
                            repeat: '',
                            place: ''),
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
                  BlocProvider.of<HomeBloc>(context).add(DeleteAllTasksEvent());
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
        BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is DeleteTaskState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(
                    'task Delete',
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeLoadedState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
                colorCode: _selectedColor.code,
                selectedDate: _selectedDate,
              );
            } else if (state is DeleteAllTasksState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
                colorCode: _selectedColor.code,
                selectedDate: _selectedDate,
              );
            } else if (state is DeleteTaskState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
                colorCode: _selectedColor.code,
                selectedDate: _selectedDate,
              );
            } else if (state is SaveTaskState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
                colorCode: _selectedColor.code,
                selectedDate: _selectedDate,
              );
            } else if (state is UpdateTaskState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
                colorCode: _selectedColor.code,
                selectedDate: _selectedDate,
              );
            } else if (state is HomeError) {
              return const Text('ERROR');
            } else if (state is HomeLoadingState) {
              return const LinearProgressIndicator();
            } else {
              return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(HomeInit());
                  },
                  child: const Text('تلاش مجدد'));
            }
          },
        )
      ],
    );
  }
}
