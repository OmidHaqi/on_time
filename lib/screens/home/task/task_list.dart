// TaskList.dart

part of '../../../index.dart';

class TaskList extends StatelessWidget {
  final DateTime selectedDate;

  const TaskList({
    super.key,
    required this.selectedDate,
  });

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<Box<TaskModel>>(
        valueListenable: taskBox.listenable(),
        builder: (context, builderTaskBox, _) {
          final todoList = builderTaskBox.values.toList();
          final tasksForSelectedDate = todoList
              .where((task) => isSameDay(task.dateTime, selectedDate))
              .toList();

          if (todoList.isEmpty || tasksForSelectedDate.isEmpty) {
            return EmptyVC(
              text: S.current.emptyPlan,
            );
          } else {
            return ListView.builder(
              itemCount: tasksForSelectedDate.length,
              itemBuilder: (contxt, index) {
                var taskList = tasksForSelectedDate[index];

                return BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return TaskCard(
                      taskList: taskList,
                      index: index,
                      editOnTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => EditTaskScreen(
                              taskModel: TaskModel(
                                id: taskList.id,
                                title: taskList.title,
                                note: taskList.note,
                                isCompleted: taskList.isCompleted,
                                dateTime: taskList.dateTime,
                                color: taskList.color,
                                place: taskList.place,
                              ),
                            ),
                          ),
                        );
                      },
                      deleteOnTap: () {
                        customeDialogee(
                          context,
                          content: S.current.deleteNoteDialogContent,
                          primaryBtn: S.current.deleteDialogPrimaryBtn,
                          secendaryBtn: S.current.deleteDialogSecendaryBtn,
                          onTapPrimaryBtn: () {
                            BlocProvider.of<TaskBloc>(context)
                                .add(DeleteTaskEvent(taskList.id));

                            Navigator.pop(context);
                          },
                          onTapSecendaryBtn: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                      onChanged: (val) {
                        BlocProvider.of<TaskBloc>(context)
                            .add(IsComplatedTaskEvent(
                          TaskModel(
                            id: taskList.id,
                            title: taskList.title,
                            note: taskList.note,
                            isCompleted: val!,
                            dateTime: taskList.dateTime,
                            color: taskList.color,
                            place: taskList.place,
                          ),
                          taskList.id,
                          val,
                        ));
                      },
                      value: taskList.isCompleted,
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
