part of '../../index.dart';

class TaskList extends StatelessWidget {
  final bool darkModeOn;
  final Box<TaskModel> box;
  final int colorCode;
  final DateTime selectedDate;
  const TaskList({
    super.key,
    required this.darkModeOn,
    required this.box,
    required this.colorCode,
    required this.selectedDate,
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
          final tasksForSelectedDate = todoList
              .where((task) =>
                  task.date.day == selectedDate.day &&
                  task.date.month == selectedDate.month &&
                  task.date.year == selectedDate.year)
              .toList();

          if (todoList.isEmpty) {
            return EmptyVC(
              darkModeOn: darkModeOn,
              text: 'امروز برنامه ای نداری',
            );
          } else if(tasksForSelectedDate.isEmpty) {
             return EmptyVC(
              darkModeOn: darkModeOn,
              text: 'امروز برنامه ای نداری',
            );
          }else{
              return ListView.builder(
              itemCount: tasksForSelectedDate.length,
              itemBuilder: (contxt, index) {
                var list = tasksForSelectedDate[index];
                list.id = index;
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      horizontalOffset: 60.0,
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(AppDimens.medium),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                  color: Color(list.color.code),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: AppDimens.small),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: AppDimens.small),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                        builder: (context) =>
                                                            AddTaskScreen(
                                                          taskModel: TaskModel(
                                                              id: list
                                                                  .id,
                                                              title:
                                                                  list
                                                                      .title,
                                                              note: list
                                                                  .note,
                                                              isCompleted:
                                                                  list
                                                                      .isCompleted,
                                                              date: list
                                                                  .date,
                                                              startTime:
                                                                  list
                                                                      .startTime,
                                                              endTime:
                                                                  list
                                                                      .endTime,
                                                              color:list
                                                                  .color,
                                                              remind: list
                                                                  .remind,
                                                              repeat:
                                                                  list
                                                                      .repeat,
                                                              place:
                                                                  list
                                                                      .place),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: const SizedBox(
                                                    height: 30,
                                                    child: Icon(
                                                      Icons.edit_note_rounded,
                                                      color: AppColors
                                                          .appPrimaryDark,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    BlocProvider.of<HomeBloc>(
                                                            context)
                                                        .add(DeleteTaskEvent(
                                                            index));
                                                  },
                                                  child: const SizedBox(
                                                    height: 30,
                                                    child: Icon(
                                                      Icons
                                                          .delete_outline_rounded,
                                                      color: AppColors
                                                          .appPrimaryDark,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: AppDimens.small),
                                            child: Text(
                                             list.title,
                                              style: AppTextStyles
                                                  .taskTitleTextStyle
                                                  .apply(
                                                color: AppColors.appPrimaryDark,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Divider(
                                        color: AppColors.appPrimaryDark,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: AppDimens.small),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: ' ساعت ',
                                                style: AppTextStyles
                                                    .taskInfoTitleTextStyle
                                                    .apply(
                                                        color: AppColors
                                                            .appPrimaryDark),
                                              ),
                                              TextSpan(
                                                text:
                                                    ' ${list.startTime.toPersianNumber()} ',
                                                style: AppTextStyles
                                                    .taskInfoTextStyle
                                                    .apply(
                                                        color: AppColors
                                                            .appPrimaryDark),
                                              ),
                                              TextSpan(
                                                text: 'تا',
                                                style: AppTextStyles
                                                    .taskInfoTitleTextStyle
                                                    .apply(
                                                        color: AppColors
                                                            .appPrimaryDark),
                                              ),
                                              TextSpan(
                                                text:
                                                    ' ${list.endTime.toPersianNumber()} ',
                                                style: AppTextStyles
                                                    .taskInfoTextStyle
                                                    .apply(
                                                        color: AppColors
                                                            .appPrimaryDark),
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
                                                        color: AppColors
                                                            .appPrimaryDark),
                                              ),
                                              TextSpan(
                                                text: list.place,
                                                style: AppTextStyles
                                                    .taskInfoTextStyle
                                                    .apply(
                                                        color: AppColors
                                                            .appPrimaryDark),
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
                                                          color: AppColors
                                                              .appPrimaryDark),
                                                ),
                                                TextSpan(
                                                  text: list.note,
                                                  style: AppTextStyles
                                                      .taskInfoTextStyle
                                                      .apply(
                                                          color: AppColors
                                                              .appPrimaryDark),
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
                        ),
                      ),
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
