import 'package:abstarct_date/abstarct_date.dart';
import 'package:abstarct_date/src/month.dart';

class Week {
  final Date referenceDate;

  Week(this.referenceDate);

  static int normalizeWeekDay(int firstWeekDay, int weekDay) {
    if (weekDay >= firstWeekDay) {
      return weekDay - firstWeekDay + 1;
    } else if (weekDay < firstWeekDay) {
      return (7 - firstWeekDay + 1) + weekDay;
    }
    throw Error();
  }

  Date get firstDayOfTheWeek {
    var wd = referenceDate.weekDay;
    var fwd = referenceDate.adapter.firstDayOfTheWeek;
    var delta = normalizeWeekDay(fwd, wd) - 1;
    if (delta == 0) return referenceDate;
    return referenceDate.add(-delta);
  }

  Date get lastDayOfTheWeek {
    var wd = referenceDate.weekDay;
    var fwd = referenceDate.adapter.firstDayOfTheWeek;
    var delta = 7 - normalizeWeekDay(fwd, wd);
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
  /// starts from 1.
  ///
  /// A week can be between two month,
  /// in that case it will return the one with the reference date in it.
  ///
  int get weekInMonth {
    var m = month;
    var week = m.firstWeek;
    for (var i = 1; i <= m.numberOfWeeks; i++) {
      if (week == this) {
        return i;
      }
      week = week.nextWeek;
    }
    throw 'week index not found!';
  }

  @override
  String toString() {
    return '${referenceDate.year}/${referenceDate.month}, week: $weekInMonth';
  }

  @override
  bool operator ==(other) {
    if (other is! Week) return false;
    return firstDayOfTheWeek == other.firstDayOfTheWeek;
  }
}
