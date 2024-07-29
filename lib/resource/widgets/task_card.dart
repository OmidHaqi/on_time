part of '../../index.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.taskList,
    required this.index,
    required this.deleteOnTap,
    required this.editOnTap,
  });
  final Function() deleteOnTap;
  final Function() editOnTap;
  final int index;
  final TaskModel taskList;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: widget.index,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        horizontalOffset: 60.0,
        child: FadeInAnimation(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.medium, vertical: AppDimens.small),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface),
                    color: widget.taskList.isCompleted
                        ? Colors.grey
                        : Color(widget.taskList.color.code),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: AppDimens.small),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.small),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: widget.editOnTap,
                                    child: const SizedBox(
                                      height: 30,
                                      child: Icon(
                                        Icons.edit_note_rounded,
                                        color: AppColors.appPrimaryDark,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: widget.deleteOnTap,
                                    child: const SizedBox(
                                      height: 30,
                                      child: Icon(
                                        Icons.delete_outline_rounded,
                                        color: AppColors.appPrimaryDark,
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
                                widget.taskList.title,
                                style: AppTextStyles.taskTitleTextStyle.apply(
                                    color: AppColors.appPrimaryDark,
                                    decoration: widget.taskList.isCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Divider(
                          color: AppColors.appPrimaryDark,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.small),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  if( widget.taskList.isCompleted)
                                       Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: RotatedBox(
                                            quarterTurns: 75,
                                            child: Column(
                                              children: [
                                                const Text(
                                                  AppStrings.done,
                                                  style: AppTextStyles
                                                      .isComplatedTextStyle,
                                                ),
                                                Container(
                                                  color: Colors.black,
                                                  height: 1,
                                                  width: 70,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animate().moveX(),
                                       Checkbox(
                                        
                                          value: widget.taskList.isCompleted,
                                          onChanged: (newValue) {
                                            setState(
                                              () {
                                                widget.taskList.isCompleted =
                                                    newValue ?? false;
                                              },
                                            );
                                          },
                                        ),
                                ],
                              )
                            ).animate().moveX(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  textDirection: TextDirection.rtl,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: ' از ساعت ',
                                      style: AppTextStyles
                                          .taskInfoTitleTextStyle
                                          .apply(
                                              color: AppColors.appPrimaryDark,
                                              decoration: widget
                                                      .taskList.isCompleted
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none),
                                    ),
                                    TextSpan(
                                      text:
                                          ' ${widget.taskList.startTime.toPersianNumber()} ',
                                      style:
                                          AppTextStyles.taskInfoTextStyle.apply(
                                        color: AppColors.appPrimaryDark,
                                        decoration: widget.taskList.isCompleted
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'تا',
                                      style: AppTextStyles
                                          .taskInfoTitleTextStyle
                                          .apply(
                                        color: AppColors.appPrimaryDark,
                                        decoration: widget.taskList.isCompleted
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' ${widget.taskList.endTime.toPersianNumber()} ',
                                      style: AppTextStyles.taskInfoTextStyle
                                          .apply(
                                              color: AppColors.appPrimaryDark,
                                              decoration: widget
                                                      .taskList.isCompleted
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none),
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
                                              color: AppColors.appPrimaryDark,
                                              decoration: widget
                                                      .taskList.isCompleted
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none),
                                    ),
                                    TextSpan(
                                      text: widget.taskList.place,
                                      style: AppTextStyles.taskInfoTextStyle
                                          .apply(
                                              color: AppColors.appPrimaryDark,
                                              decoration: widget
                                                      .taskList.isCompleted
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none),
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
                                                color: AppColors.appPrimaryDark,
                                                decoration: widget
                                                        .taskList.isCompleted
                                                    ? TextDecoration.lineThrough
                                                    : TextDecoration.none),
                                      ),
                                      TextSpan(
                                        text: widget.taskList.note,
                                        style: AppTextStyles.taskInfoTextStyle
                                            .apply(
                                                color: AppColors.appPrimaryDark,
                                                decoration: widget
                                                        .taskList.isCompleted
                                                    ? TextDecoration.lineThrough
                                                    : TextDecoration.none),
                                      )
                                    ],
                                  ),
                                ),
                              ],
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
  }
}
