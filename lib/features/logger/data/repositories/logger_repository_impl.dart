import 'package:flutter/services.dart';
import 'package:clean_architecture/core/resources/utils/logger_ext.dart';
import 'package:logger/logger.dart';
import '../../domain/repositories/logger_repository.dart';

class LoggerRepositoryImpl implements LoggerRepository {
  List<LogEvent> _logs = [];

  @override
  void addLog(LogEvent logEvent) {
    _logs.add(logEvent);
  }

  @override
  List<LogEvent> getLogs() {
    return _logs;
  }

  @override
  void copyLogsToClipboard() {
    var text = '';
    if (_logs.isNotEmpty) {
      text +=
          '||==========================================================================================\n';
      text += '|| Logs from ${_logs.first.time} to ${_logs.last.time} ||\n';
      for (final logEvent in _logs.reversed) {
        text +=
            '||==========================================================================================\n';
        text += '|| Time : ${logEvent.time}\n';
        text += '|| Level : ${logEvent.level.name} ${logEvent.level.emoji}\n';
        if (logEvent.message != null) {
          text += '|| Message : ${logEvent.message}\n';
        }
        if (logEvent.error != null) {
          text += '|| Error : ${logEvent.error}\n';
        }
        if (logEvent.stackTrace != null) {
          text += '|| Stacktrace : ${logEvent.stackTrace}\n';
        }
        text +=
            '||==========================================================================================\n';
      }
    }
    Clipboard.setData(ClipboardData(text: text));
  }
}
