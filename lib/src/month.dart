import 'date.dart';
import 'week.dart';
import 'year.dart';

///
/// This class is used to represent the [T] month that [referenceDate] of type [T] is in.
///
class Month {
  ///
  /// The reference point for this month
  ///
  final Date referenceDate;

  Month(this.referenceDate);

  ///
  /// returns index of month in year
  /// indexes start from 1
  ///
  /// for example:
  /// first month in a year is  1
  /// and last month in a year is 12
  ///
  int get monthOfYear {
    return referenceDate.month;
  }

  ///
  /// The first day of this month
  ///
  Date get firstDay {
    return referenceDate.copy(day: 1);
  }

  ///
  /// the last day of this month
  ///
  Date get lastDay {
    return referenceDate.copy(day: referenceDate.monthLength);
  }

  ///
  /// The month after this month
  ///
  Month get nextMonth {
    return Month(lastDay.add(1));
  }

  ///
  /// The month before this month
  ///
  Month get lastMonth {
    return Month(firstDay.add(-1));
  }

  ///
  /// The first week of this month
  ///
  Week get firstWeek {
    return Week(firstDay);
  }

  ///
  /// The last week of this month
  ///
  Week get lastWeek {
    return Week(lastDay);
  }

  ///
  /// The year containing this month
  ///
  Year get year {
    return Year(referenceDate);
  }

  ///
  /// The number of days in this month
  ///
  int get length {
    return referenceDate.monthLength;
  }

  ///
  /// The number of weeks in this month
  ///
  int get numberOfWeeks {
    const baseDays = 7 * 3;
    var fwd = firstDay.nWeekDay;
    var daysInTheFirstWeek = 7 - fwd + 1;
    var ml = length - baseDays - daysInTheFirstWeek;
    var weeks = 4 + (ml / 7).ceil();
    return weeks;
  }

  ///
  /// weeks in this month
  ///
  Iterable<Week> get weeks sync* {
    var weeks = numberOfWeeks;
    var week = firstDay.week;
    for (var i = 0; i < weeks; i++) {
      yield week;
      week = week.nextWeek;
    }
  }

  ///
  /// days in this month
  ///
  Iterable<Date> get days sync* {
    var days = length;
    var day = firstDay;
    for (var i = 0; i < days; i++) {
      yield day;
      day = day.tomorrow;
    }
  }

  @override
  String toString() {
    return '${referenceDate.year}/${referenceDate.month}';
  }
}
