part of '../../index.dart';

String getFarsiNumberStr(String number) {
  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  for (var element in en) {
    number = number.replaceAll(element, fa[en.indexOf(element)]);
  }

  return number;
}

String getFarsiNumberInt(int number) {
  String numStr = number.toString();
  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  for (var element in en) {
    numStr = numStr.replaceAll(element, fa[en.indexOf(element)]);
  }

  return numStr;
}

String getPersianMonthStr(String month) {
  const en = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];

  const perMonth = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];

  for (var i = 0; i < en.length; i++) {
    if (month == en[i]) {
      return perMonth[i];
    }
  }

  return month; // اگر ماه ورودی معتبر نباشد، همان مقدار ورودی را برمی‌گرداند
}

String getPersianMonthInt(int month) {
  String strMonth = month.toString();
  const en = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];

  const perMonth = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];

  for (var i = 0; i < en.length; i++) {
    if (strMonth == en[i]) {
      return perMonth[i];
    }
  }

  return strMonth;
}

String getGregorianMonthInt(int month) {
  String strMonth = month.toString();
  const en = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];

  const perMonth = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  for (var i = 0; i < en.length; i++) {
    if (strMonth == en[i]) {
      return perMonth[i];
    }
  }

  return strMonth;
}

extension PersianNumbersStr on String {
  String toPersianNumber() {
    return getFarsiNumberStr(this);
  }

  String toPesianMonth() {
    return getPersianMonthStr(this);
  }
}

extension PersianNumbersInt on int {
  String toPersianNumberInt() {
    return getFarsiNumberInt(this);
  }

  String toPesianMonth() {
    return getPersianMonthInt(this);
  }

  String toGregorianMonth() {
    return getGregorianMonthInt(this);
  }
}

extension SizedBoxExtention on double {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}
