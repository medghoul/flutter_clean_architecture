
import 'package:clean_architecture/core/enums/log_level.dart';
import 'package:flutter/material.dart';

class LoggingConfiguration {
  final bool isEnabled;
  final bool printTime;
  final LogLevel loggingLevel;
  final ValueChanged<String>? onLog;

  LoggingConfiguration({
    this.printTime = true,
    this.onLog,
    this.isEnabled = true,
    this.loggingLevel = LogLevel.debug,
  });
}

abstract class Log {
  void verbose(String message, {dynamic error, StackTrace? trace});
  void debug(String message, {dynamic error, StackTrace? trace});
  void info(String message, {dynamic error, StackTrace? trace});
  void warning(String message, {dynamic error, StackTrace? trace});
  void error(String message, {dynamic error, StackTrace? trace});

  void v(String message, {dynamic error, StackTrace? trace}) =>
      verbose(message, error: error, trace: trace);
  void d(String message, {dynamic error, StackTrace? trace}) =>
      debug(message, error: error, trace: trace);
  void i(String message, {dynamic error, StackTrace? trace}) =>
      info(message, error: error, trace: trace);
  void w(String message, {dynamic error, StackTrace? trace}) =>
      warning(message, error: error, trace: trace);
  void e(String message, {dynamic error, StackTrace? trace}) =>
      this.error(message, error: error, trace: trace);
}

extension LoggerExtension on Object {
  Log get logger => PrefixLogger(
        runtimeType.toString(),
        LoggingFactory.provide(),
      );
}

Log get staticLogger => LoggingFactory.provide();

class LoggingFactory {
  static Log? _instance;

  static Log provide() {
    if (_instance == null) {
      throw Exception("logger not configured");
    }
    return _instance!;
  }

  static Log configure(LoggingConfiguration configuration) {
    return resetWithLogger(configuration.isEnabled
        ? SimpleLoggerImpl()
        : VoidLogger());
  }

  static Log resetWithLogger(Log logger) {
    return _instance = logger;
  }
}

@visibleForTesting
class SimpleLoggerImpl extends Log {
  @override
  void debug(String message, {dynamic error, StackTrace? trace}) {
    debugPrint('DEBUG: $message');
    if (error != null) debugPrint('Error: $error');
    if (trace != null) debugPrint('StackTrace: $trace');
  }

  @override
  void error(String message, {dynamic error, StackTrace? trace}) {
    debugPrint('ERROR: $message');
    if (error != null) debugPrint('Error: $error');
    if (trace != null) debugPrint('StackTrace: $trace');
  }

  @override
  void info(String message, {dynamic error, StackTrace? trace}) {
    debugPrint('INFO: $message');
    if (error != null) debugPrint('Error: $error');
    if (trace != null) debugPrint('StackTrace: $trace');
  }

  @override
  void verbose(String message, {dynamic error, StackTrace? trace}) {
    debugPrint('VERBOSE: $message');
    if (error != null) debugPrint('Error: $error');
    if (trace != null) debugPrint('StackTrace: $trace');
  }

  @override
  void warning(String message, {dynamic error, StackTrace? trace}) {
    debugPrint('WARNING: $message');
    if (error != null) debugPrint('Error: $error');
    if (trace != null) debugPrint('StackTrace: $trace');
  }
}

@visibleForTesting
class VoidLogger implements Log {
  @override
  void d(String message, {error, StackTrace? trace}) {}

  @override
  void debug(String message, {error, StackTrace? trace}) {}

  @override
  void e(String message, {error, StackTrace? trace}) {}

  @override
  void error(String message, {error, StackTrace? trace}) {}

  @override
  void i(String message, {error, StackTrace? trace}) {}

  @override
  void info(String message, {error, StackTrace? trace}) {}

  @override
  void v(String message, {error, StackTrace? trace}) {}

  @override
  void verbose(String message, {error, StackTrace? trace}) {}

  @override
  void w(String message, {error, StackTrace? trace}) {}

  @override
  void warning(String message, {error, StackTrace? trace}) {}
}

@visibleForTesting
class PrefixLogger extends Log {
  final Log _delegate;
  final String _name;

  @visibleForTesting
  PrefixLogger(this._name, this._delegate);

  @override
  void debug(String message, {error, StackTrace? trace}) =>
      _delegate.debug('[$_name] $message', error: error, trace: trace);

  @override
  void error(String message, {Object? error, StackTrace? trace}) =>
      _delegate.error('[$_name] $message', error: error, trace: trace);

  @override
  void info(String message, {error, StackTrace? trace}) =>
      _delegate.info('[$_name] $message', error: error, trace: trace);

  @override
  void verbose(String message, {error, StackTrace? trace}) =>
      _delegate.verbose('[$_name] $message', error: error, trace: trace);

  @override
  void warning(String message, {error, StackTrace? trace}) =>
      _delegate.warning('[$_name] $message', error: error, trace: trace);
}
