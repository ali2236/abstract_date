import 'package:abstarct_date/abstarct_date.dart';

class GregorianDate extends DateAdapter with DateFormatter {
  @override
  String get id => 'GregorianDate';

  @override
  int get firstDayOfTheWeek => DateTime.monday;

  @override
  AbstractDate fromDateTime(DateTime dateTime) {
    return Date<GregorianDate>(dateTime.year, dateTime.month, dateTime.day);
  }

  @override
  DateTime toDateTime(AbstractDate date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  int monthLength(int year, int month) {
    return DateTime(year, month)
        .difference(DateTime(year, month + 1, 0))
        .inDays;
  }

  @override
  String monthName(int month) {
    const names = [
      null,
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
      'December',
    ];
    return names[month];
  }

  @override
  String weekDayName(int weekDay) {
    const names = [
      null,
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return names[weekDay];
  }
}
