abstract class AbstractDate {

  final int year, month, day;

  AbstractDate(this.year, this.month, this.day);

  @override
  String toString() => '$year/$month/$day';
}