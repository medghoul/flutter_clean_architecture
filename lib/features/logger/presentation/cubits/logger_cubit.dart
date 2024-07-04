import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/logger/domain/usecases/add_log.dart';
import 'package:clean_architecture/features/logger/domain/usecases/copy_logs_to_clipboard.dart';
import 'package:clean_architecture/features/logger/domain/usecases/get_logs.dart';
import 'package:logger/logger.dart';

class LoggerCubit extends Cubit<List<LogEvent>> {
  final AddLog addLog;
  final GetLogs getLogs;
  final CopyLogsToClipboard copyLogsToClipboard;

  LoggerCubit({
    required this.addLog,
    required this.getLogs,
    required this.copyLogsToClipboard,
  }) : super([]);

  void addLogEvent(LogEvent logEvent) {
    addLog(logEvent);
    emit(getLogs());
  }

  void copyLogs() {
    copyLogsToClipboard();
  }

  void fetchLogs() {
    emit(getLogs());
  }
}
