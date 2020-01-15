import 'date.dart';

abstract class DateAdapter<T extends AbstractDate> {

  T fromDateTime(DateTime dateTime);

  DateTime toDateTime(T date);

}

abstract class AbstractDate {

  final int year, month, day;

  AbstractDate(this.year, this.month, this.day);

  @override
  String toString() => '$year/$month/$day';
}