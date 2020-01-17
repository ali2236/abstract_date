import 'abstract_date.dart';


abstract class DateAdapter<T extends AbstractDate> {

  T fromDateTime(DateTime dateTime);

  DateTime toDateTime(T date);

  int monthLength(int year, int month);

}