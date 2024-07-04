import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

class LogEventEntity extends Equatable {
  final Level level;
  final DateTime time;
  final dynamic message;
  final dynamic error;
  final StackTrace? stackTrace;

  const LogEventEntity({
    required this.level,
    required this.time,
    this.message,
    this.error,
    this.stackTrace,
  });

  @override
  List<Object?> get props => [level, time, message, error, stackTrace];
}
