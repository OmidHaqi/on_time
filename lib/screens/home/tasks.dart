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
    final darkModeOn =
        BlocProvider.of<ThemeBloc>(context).state == ThemeMode.dark;
    String day = _selectedDate.day.toPersianNumberInt();
    String month = _selectedDate.month.toPersianNumberInt();
    String year = _selectedDate.year.toPersianNumberInt();
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
        Container(
          padding: const EdgeInsets.all(AppDimens.small),
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            calendarType: CalendarType.persianDate,
            height: 90,
            dateTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
            dayTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface, fontSize: 12),
            monthTextStyle:
                TextStyle(color: Theme.of(context).colorScheme.onSurface),
            daysCount: 30,
            selectedTextColor: Colors.green,
            directionality: TextDirection.ltr,
            onDateChange: (date) {
              setState(() {
                _selectedDate = date;
              });

              // New date selected
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppDimens.medium),
              child: IconButton.filled(
                iconSize: 35,
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => AddTaskScreen()));
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
              );
            } else if (state is DeleteAllTasksState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
              );
            } else if (state is DeleteTaskState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
              );
            } else if (state is SaveTaskState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
              );
            } else if (state is UpdateTaskState) {
              return TaskList(
                box: box,
                darkModeOn: darkModeOn,
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
