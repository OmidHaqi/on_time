import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:on_time/gen/assets.gen.dart';
import 'package:on_time/resource/app_dimens.dart';
import 'package:on_time/resource/components/text_style.dart';
import 'package:on_time/resource/constants.dart';
import 'package:on_time/resource/themes/bloc/theme_bloc.dart';
import 'package:on_time/resource/utils/extensions.dart';
import 'package:on_time/screens/add_task_screen/add_task_screen.dart';
import 'package:on_time/screens/home/bloc/home_bloc.dart';

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
            calendarType: CalendarType.gregorianDate,
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
            selectedTextColor: Theme.of(context).colorScheme.onSurface,
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
                          builder: (context) => const AddTaskScreen()));
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
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeLoaded) {
              return SizedBox(
                  width: double.infinity,
                  //TODO:responsive this sizesbox
                  height: 475,
                  child: state.allTaskList.isNotEmpty
                      ? ListView.builder(
                          itemCount: state.allTaskList.length,
                          itemBuilder: (contxt, index) {
                            return Padding(
                              padding: const EdgeInsets.all(AppDimens.medium),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: AppDimens.small),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: SizedBox(
                                                  height: 30,
                                                  width: 40,
                                                  child: Icon(
                                                    Icons
                                                        .delete_outline_rounded,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal:
                                                            AppDimens.small),
                                                child: Text(
                                                  state
                                                      .allTaskList[index].title,
                                                  style: AppTextStyles
                                                      .taskTitleTextStyle
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Divider(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
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
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onPrimary),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '${state.allTaskList[index].startTime.toPersianNumber()} تا ${state.allTaskList[index].endTime.toPersianNumber()}',
                                                    style: AppTextStyles
                                                        .taskInfoTextStyle
                                                        .apply(
                                                            color: Theme.of(
                                                                    context)
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
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onPrimary),
                                                  ),
                                                  TextSpan(
                                                    text: 'بخش توسعه',
                                                    style: AppTextStyles
                                                        .taskInfoTextStyle
                                                        .apply(
                                                            color: Theme.of(
                                                                    context)
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
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onPrimary),
                                                    ),
                                                    TextSpan(
                                                      text: state
                                                          .allTaskList[index]
                                                          .note,
                                                      style: AppTextStyles
                                                          .taskInfoTextStyle
                                                          .apply(
                                                              color: Theme.of(
                                                                      context)
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
                        )
                      : Center(
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
                        ));
            } else if (state is HomeError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              throw Exception('======== INVALID STATE ========');
            }
          },
        )
      ],
    );
  }
}
