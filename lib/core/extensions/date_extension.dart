import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String getFormatDayMonthYear() {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}