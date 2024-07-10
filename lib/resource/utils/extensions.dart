String getFarsiNumber(String number) {
  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  for (var element in en) {
    number = number.replaceAll(element, fa[en.indexOf(element)]);
  }

  return number;
}

String getPersianMonth(String month) {
  const en = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];

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

extension PersianNumbers on String {
  String toPersianNumber() {
    return getFarsiNumber(this);
  }

  String toPesianMonth() {
    return getPersianMonth(this);
  }
}
