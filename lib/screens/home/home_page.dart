import 'package:flutter/material.dart';
import 'package:on_time/resource/constants.dart';
import 'package:on_time/resource/utils/presian_calendar.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.appName),
        ),
        body: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
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
      ),
    );
  }
}
