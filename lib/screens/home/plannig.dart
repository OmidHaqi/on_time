part of '../../index.dart';

final box = Hive.box<TaskModel>(taskBoxName);

class Plannig extends StatefulWidget {
  const Plannig({
    super.key,
  });

  @override
  State<Plannig> createState() => _PlannigState();
}

class _PlannigState extends State<Plannig> {
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
                          builder: (context) => AddTaskScreen(
                              taskModel: TaskModel(1,
                                  color: 1,
                                  date: '',
                                  endTime: '',
                                  isCompleted: 1,
                                  note: '',
                                  place: '',
                                  remind: 1,
                                  repeat: '',
                                  startTime: '',
                                  title: ''))));
                },
                icon: const Icon(Icons.add_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimens.medium),
              child: Text(
                AppStrings.planning,
                style: AppTextStyles.bodyTitleTextStyle.apply(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        BlocBuilder<HomeBloc, HomeState>(
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

class TaskList extends StatelessWidget {
  final bool darkModeOn;
  final Box<TaskModel> box;
  const TaskList({
    super.key,
    required this.darkModeOn,
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 475,
      child: ValueListenableBuilder<Box<TaskModel>>(
        valueListenable: box.listenable(),
        builder: (context, taskBox, child) {
          final todoList = taskBox.values.toList();

          if (todoList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    darkModeOn
                        ? Assets.images.svg.vcEmptyDark
                        : Assets.images.svg.vcEmptyLight,
                    height: 200,
                  ),
                  AppDimens.medium.height,
                  Text(
                    'امروز برنامه ای نداری',
                    style: AppTextStyles.emptyTextStyle.copyWith(
                        background: Paint()
                          ..strokeJoin = StrokeJoin.round
                          ..style = PaintingStyle.stroke
                          ..color = Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.1)
                          ..strokeWidth = 25),
                  )
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (contxt, index) {
                todoList[index].id = box.keyAt(index);
                return Padding(
                  padding: const EdgeInsets.all(AppDimens.medium),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: AppDimens.small),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(DeleteTaskEvent(index));
                                    },
                                    child: SizedBox(
                                      height: 30,
                                      width: 40,
                                      child: Icon(
                                        Icons.delete_outline_rounded,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppDimens.small),
                                    child: Text(
                                      todoList[index].title,
                                      style: AppTextStyles.taskTitleTextStyle
                                          .apply(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Divider(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.small),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: ' ساعت ',
                                        style: AppTextStyles
                                            .taskInfoTitleTextStyle
                                            .apply(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                      ),
                                      TextSpan(
                                        text:
                                            '${todoList[index].startTime.toPersianNumber()} تا ${todoList[index].endTime.toPersianNumber()}',
                                        style: AppTextStyles.taskInfoTextStyle
                                            .apply(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                      )
                                    ]),
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'مکان ',
                                        style: AppTextStyles
                                            .taskInfoTitleTextStyle
                                            .apply(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                      ),
                                      TextSpan(
                                        text: todoList[index].place,
                                        style: AppTextStyles.taskInfoTextStyle
                                            .apply(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                      )
                                    ]),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'یادداشت ',
                                          style: AppTextStyles
                                              .taskInfoTitleTextStyle
                                              .apply(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary),
                                        ),
                                        TextSpan(
                                          text: todoList[index].note,
                                          style: AppTextStyles.taskInfoTextStyle
                                              .apply(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
