import 'date_adapter.dart';

mixin EfficientLeapYear on DateAdapter {
  bool isLeapYear(int year);
}
