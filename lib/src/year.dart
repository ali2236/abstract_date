import 'package:abstarct_date/abstarct_date.dart';

class Year {
  final Date referenceDate;

  Year(this.referenceDate);

  ///
  /// number of days in this year
  ///
  int get length {}

  Iterable<Month> get months sync* {}

  Iterable<Date> get days sync* {}

  bool get leapYear {}
}
