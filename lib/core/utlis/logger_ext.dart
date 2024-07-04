import 'package:logger/logger.dart';

extension LogEventExt on Level {
  String get emoji {
    switch (this) {
      case Level.all:
        return '☄️';
      case Level.verbose:
        return '🗣';
      case Level.trace:
        return '🔎';
      case Level.debug:
        return '🧑‍💻️';
      case Level.info:
        return '📢';
      case Level.warning:
        return '⚠️';
      case Level.error:
        return '💢';
      case Level.wtf:
        return '☠️';
      case Level.fatal:
        return '☠️';
      case Level.nothing:
        return '🔕';
      case Level.off:
        return '🔕';
    }
  }
}
