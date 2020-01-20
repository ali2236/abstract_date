import 'date.dart';

class FormattedDate {

  final Date date;

  FormattedDate(this.date);

  String get yyyy => date.year.toString();

  String get yy => yyyy.substring(yyyy.length-3);

  String get m => date.month.toString();

  String get mm => date.month < 10 ? '0${date.month}' : m;

  String get MM => date.monthName.substring(0, 3);

  String get MMMM => date.monthName;

  String get d => date.day.toString();

  String get dd => date.day < 10 ? '0${date.day}' : date.day.toString();

  String get DD => DDDD.substring(0, 1);

  String get DDDD => date.weekDayName;

}