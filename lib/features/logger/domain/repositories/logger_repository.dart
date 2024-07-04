import 'package:logger/logger.dart';

abstract class LoggerRepository {
  void addLog(LogEvent logEvent);
  List<LogEvent> getLogs();
  void copyLogsToClipboard();
}
