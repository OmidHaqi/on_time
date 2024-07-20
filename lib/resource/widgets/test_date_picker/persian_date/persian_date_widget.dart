
import 'package:flutter/material.dart';
import 'package:on_time/resource/widgets/test_date_picker/gestures/tap.dart';
import 'package:on_time/resource/widgets/test_date_picker/persian_date/persian_date.dart';
import 'package:on_time/resource/widgets/test_date_picker/persian_date/persian_number.dart';

class PersianDateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  const PersianDateWidget({super.key, 
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Container(
        width: width,
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: selectionColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text((PersianDate.persianMonthNames(date.month)), // Month
                  style: monthTextStyle),
              Text('${date.day}'.toPersianDigit(), // Date
                  style: dateTextStyle),
              Text((PersianDate.persianWeeklyName(date)), // WeekDay
                  style: dayTextStyle)
            ],
          ),
        ),
      ),
      onTap: () {
        onDateSelected?.call(date);
      },
    );
  }
}