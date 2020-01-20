
import 'date.dart';
import 'date_adapter.dart';

mixin DateFormatter on DateAdapter {

  String monthName(int month);

  //
  // weekday is in DateTime week day so for example monday is 1
  //
  String weekDayName(int weekDay);

}