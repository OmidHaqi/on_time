// TaskList.dart

part of '../../../index.dart';

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

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

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
              .where((task) => isSameDay(task.date, selectedDate))
              .toList();

          if (todoList.isEmpty || tasksForSelectedDate.isEmpty) {
            return EmptyVC(
              darkModeOn: darkModeOn,
              text: 'امروز برنامه ای نداری',
            );
          } else {
            return ListView.builder(
              itemCount: tasksForSelectedDate.length,
              itemBuilder: (contxt, index) {
                var taskList = tasksForSelectedDate[index];
                return TaskItemList(
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
                            date: taskList.date,
                            startTime: taskList.startTime,
                            endTime: taskList.endTime,
                            color: taskList.color,
                            remind: taskList.remind,
                            repeat: taskList.repeat,
                            place: taskList.place,
                          ),
                        ),
                      ),
                    );
                  },
                  deleteOnTap: () {
                    BlocProvider.of<TaskBloc>(context)
                        .add(DeleteTaskEvent(taskList.id));
                    print('Index: $index');
                    print('Task ID: ${taskList.id}');
                    print('Task Title: ${taskList.title}');
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
