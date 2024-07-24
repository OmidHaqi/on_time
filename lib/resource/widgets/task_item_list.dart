part of '../../index.dart';
class TaskItemList extends StatelessWidget {
  const TaskItemList({
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
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        horizontalOffset: 60.0,
        child: FadeInAnimation(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:  AppDimens.medium,vertical: AppDimens.small),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface),
                    color: Color(taskList.color.code),
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
                                    onTap: editOnTap,
                                    child: const SizedBox(
                                      height: 30,
                                      child: Icon(
                                        Icons.edit_note_rounded,
                                        color: AppColors.appPrimaryDark,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: deleteOnTap,
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
                                taskList.title,
                                style: AppTextStyles.taskTitleTextStyle.apply(
                                  color: AppColors.appPrimaryDark,
                                ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: ' از ساعت ',
                                  style: AppTextStyles.taskInfoTitleTextStyle
                                      .apply(color: AppColors.appPrimaryDark),
                                ),
                                TextSpan(
                                  text:
                                      ' ${taskList.startTime.toPersianNumber()} ',
                                  style: AppTextStyles.taskInfoTextStyle
                                      .apply(color: AppColors.appPrimaryDark),
                                ),
                                TextSpan(
                                  text: 'تا',
                                  style: AppTextStyles.taskInfoTitleTextStyle
                                      .apply(color: AppColors.appPrimaryDark),
                                ),
                                TextSpan(
                                  text:
                                      ' ${taskList.endTime.toPersianNumber()} ',
                                  style: AppTextStyles.taskInfoTextStyle
                                      .apply(color: AppColors.appPrimaryDark),
                                )
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'مکان ',
                                  style: AppTextStyles.taskInfoTitleTextStyle
                                      .apply(color: AppColors.appPrimaryDark),
                                ),
                                TextSpan(
                                  text: taskList.place,
                                  style: AppTextStyles.taskInfoTextStyle
                                      .apply(color: AppColors.appPrimaryDark),
                                )
                              ]),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'یادداشت ',
                                    style: AppTextStyles.taskInfoTitleTextStyle
                                        .apply(color: AppColors.appPrimaryDark),
                                  ),
                                  TextSpan(
                                    text: taskList.note,
                                    style: AppTextStyles.taskInfoTextStyle
                                        .apply(color: AppColors.appPrimaryDark),
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
  }
}
