import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

abstract class LoggerState extends Equatable {
  const LoggerState();

  @override
  List<Object?> get props => [];
}

class LoggerInitial extends LoggerState {}

class LoggerLoaded extends LoggerState {
  final List<LogEvent> logs;

  const LoggerLoaded(this.logs);

  @override
  List<Object?> get props => [logs];
}
