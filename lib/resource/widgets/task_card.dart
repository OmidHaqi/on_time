part of '../../index.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.taskList,
    required this.index,
    required this.deleteOnTap,
    required this.editOnTap,
    required this.value,
    required this.onChanged,
  });
  final Function() deleteOnTap;
  final Function() editOnTap;
  final Function(bool?) onChanged;
  final int index;
  final TaskModel taskList;
  final bool value;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    String lang =
        BlocProvider.of<SettingsBloc>(context).state.locale.languageCode;
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
                  child: Theme(
                    data: AppTheme.lightTheme(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: AppDimens.small,
                            bottom:
                                widget.taskList.dateTime.toString().isEmpty &&
                                        
                                        widget.taskList.note.isEmpty
                                    ? AppDimens.small
                                    : 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: widget.taskList.dateTime
                                              .toString()
                                              .isEmpty &&
                                         
                                          widget.taskList.note.isEmpty
                                      ? AppDimens.large
                                      : AppDimens.small,
                                ),
                                child: SizedBox(
                                  width: size.width * 0.50,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    widget.taskList.title,
                                    style:
                                        AppTextStyles.taskTitleTextStyle.apply(
                                      color: AppColors.appPrimaryDark,
                                      decoration: widget.taskList.isCompleted
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.small,
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: widget.editOnTap,
                                      child: const SizedBox(
                                        height: 30,
                                        child: Icon(
                                          Icons.edit_note_rounded,
                                          color: AppColors.appPrimaryDark,
                                          size: 30,
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
                                    if (widget.taskList.dateTime
                                            .toString()
                                            .isEmpty &&
                                        
                                        widget.taskList.note.isEmpty)
                                      Checkbox(
                                          value:widget.value,
                                          onChanged: widget.onChanged),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (widget.taskList.dateTime.toString().isNotEmpty ||
                            
                            widget.taskList.note.isNotEmpty)
                          Column(
                            children: [
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.60,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: S.current.taskCardTime,
                                                  style: AppTextStyles
                                                      .taskInfoTitleTextStyle
                                                      .apply(
                                                    fontFamily: lang == 'fa'
                                                        ? 'YekanBakhNumFa'
                                                        : 'Ubuntu',
                                                    color: AppColors
                                                        .appPrimaryDark,
                                                    decoration: widget.taskList
                                                            .isCompleted
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                                  ),
                                                ),
                                                if (widget.taskList.dateTime
                                                    .toString()
                                                    .isNotEmpty)
                                                  TextSpan(
                                                    text:
                                                        '${widget.taskList.dateTime.hour}:${widget.taskList.dateTime.minute}',
                                                    style: AppTextStyles
                                                        .taskInfoTextStyle
                                                        .apply(
                                                      fontFamily: lang == 'fa'
                                                          ? 'YekanBakhNumFa'
                                                          : 'Ubuntu',
                                                      color: AppColors
                                                          .appPrimaryDark,
                                                      decoration: widget
                                                              .taskList
                                                              .isCompleted
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          
                                          if (widget.taskList.note.isNotEmpty)
                                            RichText(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        S.current.taskCardNote,
                                                    style: AppTextStyles
                                                        .taskInfoTitleTextStyle
                                                        .apply(
                                                      fontFamily: lang == 'fa'
                                                          ? 'YekanBakhNumFa'
                                                          : 'Ubuntu',
                                                      color: AppColors
                                                          .appPrimaryDark,
                                                      decoration: widget
                                                              .taskList
                                                              .isCompleted
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: widget.taskList.note,
                                                    style: AppTextStyles
                                                        .taskInfoTextStyle
                                                        .apply(
                                                      fontFamily: lang == 'fa'
                                                          ? 'YekanBakhNumFa'
                                                          : 'Ubuntu',
                                                      color: AppColors
                                                          .appPrimaryDark,
                                                      decoration: widget
                                                              .taskList
                                                              .isCompleted
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        child: Row(
                                      children: [
                                        Checkbox(
                                            value: widget.value,
                                            onChanged: widget.onChanged),
                                      ],
                                    )).animate().moveX(),
                                    if (widget.taskList.isCompleted)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: RotatedBox(
                                          quarterTurns: 75,
                                          child: Text(
                                            S.current.done,
                                            style: AppTextStyles
                                                .isComplatedTextStyle
                                                .apply(
                                                    color: AppColors
                                                        .appPrimaryDark),
                                          ),
                                        ),
                                      ).animate().move(),
                                  ],
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
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
