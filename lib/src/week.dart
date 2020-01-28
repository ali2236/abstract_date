import 'package:abstarct_date/abstarct_date.dart';
import 'package:abstarct_date/src/month.dart';

class Week {
  final Date referenceDate;

  Week(this.referenceDate);

  Date get firstDayOfTheWeek {
    var wd = referenceDate.weekDay;
    var fwd = referenceDate.adapter.firstDayOfTheWeek;
    var delta = normalizeWeekDay(wd, fwd) - 1;
    if(delta==0) return referenceDate;
    return referenceDate.add(Duration(days: -delta));
  }

  Date get lastDayOfTheWeek {
    var wd = referenceDate.weekDay;
    var fwd = referenceDate.adapter.firstDayOfTheWeek;
    var delta = 7 - normalizeWeekDay(wd, fwd);
    return referenceDate.add(Duration(days: delta));
  }

  Week get nextWeek {
    // TODO
  }

  Week get lastWeek {
    // TODO
  }

  Month get month {
    return Month(referenceDate);
  }

  static int normalizeWeekDay(int weekDay, int firstWeekDay){
    DateTime.saturday;
    if (weekDay >= firstWeekDay) {
      return weekDay - firstWeekDay + 1;
    } else if(weekDay < firstWeekDay) {
      return (7 - firstWeekDay + 1) + weekDay;
    }
  }
}
