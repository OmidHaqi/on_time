import 'package:flutter/material.dart';
import 'package:on_time/resource/app_dimens.dart';
import 'package:on_time/resource/components/text_style.dart';
import 'package:on_time/resource/constants.dart';
import 'package:on_time/resource/utils/extensions.dart';
import 'package:on_time/resource/utils/presian_calendar.dart';
import 'package:on_time/resource/widgets/time_line/event_item.dart';
import 'package:on_time/resource/widgets/time_line/indicator_position.dart';
import 'package:on_time/screens/home/planner_time_line.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class Plannig extends StatefulWidget {
  const Plannig({
    super.key,
  });

  @override
  State<Plannig> createState() => _PlannigState();
}

class _PlannigState extends State<Plannig> {
  late List<TimelineEventDisplay> events;
  bool isChecked = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    events = [
      taskEvent,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: PersianCalendar(
              firstDate: Jalali(1385, 8),
              initialDate: Jalali.now(),
              lastDate: Jalali(1450, 8),
              onDateChanged: (Jalali? value) {
                //TODO:Dont forget
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppDimens.medium),
              child: IconButton.filled(
                iconSize: 35,
                onPressed: () => setState(() => events.add(taskEvent)),
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
        PlannerTimeLine(events: events)
      ],
    );
  }

  TimelineEventDisplay get taskEvent {
    return TimelineEventDisplay(
      anchor: IndicatorPosition.top,
      indicatorOffset: const Offset(14, 0),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.medium),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${DateTime.now().hour.toString().toPersianNumber()}:${DateTime.now().minute.toString().toPersianNumber()} - ',
                  style: AppTextStyles.chipTextStyle,
                ),
                Text(
                  '${Jalali.now().month.toString().toPesianMonth()} / ${Jalali.now().day.toString().toPersianNumber()} ',
                  style: AppTextStyles.chipTextStyle,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppDimens.small),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.small),
                          child: Text(
                            "قرار ملاقات با تیم توسعه",
                            style: AppTextStyles.taskTitleTextStyle.apply(
                                color: Theme.of(context).colorScheme.onPrimary),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppDimens.small),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: ' ساعت ',
                              style: AppTextStyles.taskInfoTitleTextStyle.apply(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            TextSpan(
                              text: '۱۵:۳۰ تا ۱۷:۰۰',
                              style: AppTextStyles.taskInfoTextStyle.apply(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            )
                          ]),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'مکان ',
                              style: AppTextStyles.taskInfoTitleTextStyle.apply(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            TextSpan(
                              text: 'بخش توسعه',
                              style: AppTextStyles.taskInfoTextStyle.apply(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            )
                          ]),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'یادداشت ',
                              style: AppTextStyles.taskInfoTitleTextStyle.apply(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            TextSpan(
                              text: ' تقدیر از این بخش',
                              style: AppTextStyles.taskInfoTextStyle.apply(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            )
                          ]),
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
      indicator: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 3),
            color: Theme.of(context).colorScheme.onPrimary,
            shape: BoxShape.circle,
          ),
          child: Checkbox(
            shape: const CircleBorder(),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
