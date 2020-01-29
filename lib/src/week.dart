import 'dart:convert';

import 'package:abstarct_date/abstarct_date.dart';
import 'package:abstarct_date/src/month.dart';

class Week {
  final Date referenceDate;

  Week(this.referenceDate);

  static int normalizeWeekDay(int weekDay, int firstWeekDay) {
    DateTime.saturday;
    if (weekDay >= firstWeekDay) {
      return weekDay - firstWeekDay + 1;
    } else if (weekDay < firstWeekDay) {
      return (7 - firstWeekDay + 1) + weekDay;
    }
  }

  Date get firstDayOfTheWeek {
    var wd = referenceDate.weekDay;
    var fwd = referenceDate.adapter.firstDayOfTheWeek;
    var delta = normalizeWeekDay(wd, fwd) - 1;
    if (delta == 0) return referenceDate;
    return referenceDate.add(-delta);
  }

  Date get lastDayOfTheWeek {
    var wd = referenceDate.weekDay;
    var fwd = referenceDate.adapter.firstDayOfTheWeek;
    var delta = 7 - normalizeWeekDay(wd, fwd);
    return referenceDate.add(delta);
  }

  ///
  /// the week after this week
  ///
  Week get nextWeek {
    return Week(lastDayOfTheWeek.tomorrow);
  }

  ///
  /// the week before this week
  ///
  Week get lastWeek {
    return Week(firstDayOfTheWeek.yesterday);
  }

  ///
  /// the month containing the [referenceDate] of the week
  /// a week can be between two month
  ///
  Month get month {
    return Month(referenceDate);
  }

  bool containsDate(Date date) {
    return date >= firstDayOfTheWeek && date <= lastDayOfTheWeek;
  }

  ///
  /// The days in this week
  ///
  Iterable<Date> get days sync* {
    var day = firstDayOfTheWeek;
    var last = lastDayOfTheWeek;
    while (day != last) {
      yield day;
      day = day.tomorrow;
    }
    yield last;
  }

  ///
  /// Index of this week in it's month.
  /// starts from 1
  ///
  int get weekInMonth {
    var month = this.month;
    var index = month.weeks.toList().indexOf(this);
    return index + 1;
  }

  @override
  String toString() {
    return jsonEncode({
      'week': days.map((d) => d.toString()).toList(),
    });
  }

  @override
  bool operator ==(other) {
    if (other != Week) return false;
    return firstDayOfTheWeek == other.firstDayOfTheWeek;
  }
}
