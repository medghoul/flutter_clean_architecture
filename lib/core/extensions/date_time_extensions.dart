import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  int get toUnixTimestamp {
    return millisecondsSinceEpoch ~/ 1000;
  }

  String get toHumanReadable {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(this);
  }


  String format([String pattern = 'dd/MM/yyyy']) {
    return DateFormat(pattern).format(this);
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  DateTime get startOfDay => DateTime(year, month, day);
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }

  int getDifferenceInDays(DateTime other) {
    return difference(other).inDays;
  }

}