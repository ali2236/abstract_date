import 'package:abstarct_date/src/week.dart';

import 'date.dart';

class Month {

  final Date referenceDate;

  Month(this.referenceDate);

  Date get firstDayOfTheMonth {
    return referenceDate.copy(day: 1);
  }

  Date get lastDayOfTheMonth {
    return referenceDate.copy(day: referenceDate.monthLength);
  }

  Month get nextMonth {
    return Month(lastDayOfTheMonth.add(Duration(days: 1)));
  }

  Month get lastMonth {
    return Month(firstDayOfTheMonth.add(Duration(days: -1)));
  }

  int get numberOfWeeks {
    // TODO
  }

  List<Week> get weeks {

  }

  @override
  String toString() {
    return '${referenceDate.year}/${referenceDate.month}';
  }

}