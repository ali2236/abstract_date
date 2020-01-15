import 'package:abstarct_date/src/date_adapter.dart';
import 'date.dart';

class ShamsiDate extends DateAdapter {

  @override
  AbstractDate fromDateTime(DateTime dateTime) {
    return Date<ShamsiDate>(
      dateTime.year - 1000,
      (dateTime.month + 4) % 13 + 1,
      dateTime.day,
    );
  }

  @override
  DateTime toDateTime(AbstractDate date) {
    return DateTime(
      date.year - 1000,
      date.month - 4,
      date.day,
    );
  }

}
