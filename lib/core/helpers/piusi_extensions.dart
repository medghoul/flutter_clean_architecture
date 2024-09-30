import 'dart:math';

import 'package:intl/intl.dart';

const String piusiDateTimeFormat = 'yyyyMMddHHmmss';

/// Estensioni di supporto
extension StringExtension on String {
  /// Convert a datetime string with Piusi format into a valid Dart DateTime
  DateTime? get toDateTime {
    try {
      if (length != piusiDateTimeFormat.length) {
        throw FormatException(
            "Invalid date format length: expected ${piusiDateTimeFormat.length}, got $length");
      }
      return DateTime.parse(
          "${substring(0, 4)}-${substring(4, 6)}-${substring(6, 8)} ${substring(8, 10)}:${substring(10, 12)}:${substring(12, 14)}");
    } catch (e) {
      print("Error parsing date: $e");
      return null;
    }
  }

  /// Convert a time string in "HHmm" format to total minutes
  int get toMinutes {
    try {
      var dateTime = DateFormat("HHmm").parse(this);
      return dateTime.hour * 60 + dateTime.minute;
    } catch (e) {
      return 0;
    }
  }

  String capitalize() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return '';
    }
  }
}

///
extension DateTimeExtension on DateTime {
  int get toUnixTimestamp {
    return millisecondsSinceEpoch ~/ 1000;
  }

  String get toPiusiDateTime {
    return DateFormat(piusiDateTimeFormat).format(this);
  }
}

extension DoubleExtension on double {
  String toFixedNoRounding(int fractionDigits) {
    double mod = pow(10.0, fractionDigits).toDouble();
    double result = (this * mod).floor() / mod;
    return result.toStringAsFixed(fractionDigits);
  }
}
