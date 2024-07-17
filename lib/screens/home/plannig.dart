import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_time/resource/app_dimens.dart';
import 'package:on_time/resource/components/text_style.dart';
import 'package:on_time/resource/constants.dart';
import 'package:on_time/resource/utils/extensions.dart';
import 'package:on_time/screens/add_task_screen/add_task_screen.dart';

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
    String day = _selectedDate.day.toPersianNumberInt();
    String month = _selectedDate.month.toPesianMonth();
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
            selectionColor: Theme.of(context).colorScheme.onSurface,
            directionality: TextDirection.ltr,
            selectedTextColor: Theme.of(context).colorScheme.surface,
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
        SizedBox(
          width: double.infinity,
          //TODO:responsive this sizesbox
          height: 475,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (contxt, index) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
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
                                    "قرار ملاقات با تیم توسعه",
                                    style: AppTextStyles.taskTitleTextStyle
                                        .apply(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                      text: '۱۵:۳۰ تا ۱۷:۰۰',
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
                                      text: 'بخش توسعه',
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
                                        text: ' تقدیر از این بخش',
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
          ),
        )
      ],
    );
  }
}
