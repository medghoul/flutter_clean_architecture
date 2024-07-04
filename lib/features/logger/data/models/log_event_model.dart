import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

class LogEventModel extends Equatable {
  final Level level;
  final DateTime time;
  final dynamic message;
  final dynamic error;
  final StackTrace? stackTrace;

  const LogEventModel({
    required this.level,
    required this.time,
    this.message,
    this.error,
    this.stackTrace,
  });

  @override
  List<Object?> get props => [level, time, message, error, stackTrace];

  factory LogEventModel.fromLogEvent(LogEvent logEvent) {
    return LogEventModel(
      level: logEvent.level,
      time: logEvent.time,
      message: logEvent.message,
      error: logEvent.error,
      stackTrace: logEvent.stackTrace,
    );
  }

  LogEvent toLogEvent() {
    return LogEvent(
      level,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
