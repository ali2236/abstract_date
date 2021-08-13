import '../abstract_date.dart';

abstract class DateAdapter<T extends AbstractDate> {

  String get id;

  int get firstDayOfTheWeek;

  T fromDateTime(DateTime dateTime);

  DateTime toDateTime(AbstractDate date);

  int monthLength(int year, int month);
}
