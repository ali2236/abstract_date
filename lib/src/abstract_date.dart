abstract class AbstractDate<T> implements Comparable<AbstractDate<T>>{

  final int year, month, day;

  AbstractDate(this.year, this.month, this.day);

  @override
  bool operator ==(other) {
    if(other is! AbstractDate<T>) return false;
    return day == other.day && month == other.month && year == other.year;
  }

  @override
  int compareTo(AbstractDate<T> other) {
    if(year > other.year) return 1;
    if(year < other.year) return -1;

    if(month > other.month) return 1;
    if(month < other.month) return -1;

    if(day > other.day) return 1;
    if(day < other.day) return -1;

    return 0;
  }

  @override
  String toString() => '$year/$month/$day';
}