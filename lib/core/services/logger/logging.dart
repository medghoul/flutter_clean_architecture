import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/services/logger/logger.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/services/logger/network_error.dart';

/// Configuration for the logging system.
///
/// This class provides a centralized way to configure various aspects of the logging
/// behavior throughout the application. It allows for flexible customization of logging
/// preferences and output formats.
class LoggingConfiguration {
  /// Whether to log network-related information.
  ///
  /// If true, the logger will output details about network requests and responses.
  /// Useful for debugging API calls and network issues.
  final bool shouldLogNetworkInfo;

  /// Whether logging is enabled.
  ///
  /// If false, all logging calls will be ignored. This can be used to completely
  /// disable logging in production environments.
  final bool isEnabled;

  /// Whether to include timestamps in log messages.
  ///
  /// If true, each log message will be prefixed with the current time in the format
  /// "HH:mm:ss.mmm".
  final bool printTime;

  /// The minimum level of messages to log.
  ///
  /// Messages below this level will be ignored. This helps control the verbosity
  /// of the logging output.
  final Level loggingLevel;

  /// A callback function to handle log messages.
  ///
  /// If provided, this function will be called with each log message. This can be
  /// used to integrate with external logging services or crash reporting tools.
  final ValueChanged<String>? onLog;

  /// Creates a new [LoggingConfiguration] instance.
  ///
  /// All parameters are optional and have default values suitable for development
  /// environments.
  ///
  /// Parameters:
  /// - [shouldLogNetworkInfo]: Enable network logging (default: false)
  /// - [printTime]: Include timestamps (default: true)
  /// - [onLog]: Callback for log messages (default: null)
  /// - [isEnabled]: Enable logging (default: true)
  /// - [loggingLevel]: Minimum log level (default: Level.trace)
  LoggingConfiguration({
    this.shouldLogNetworkInfo = false,
    this.printTime = true,
    this.onLog,
    this.isEnabled = true,
    this.loggingLevel = Level.trace,
  });
}

/// Abstract class defining the interface for logging.
///
/// This interface provides a standard set of methods for logging at different
/// levels and with different types of information. It ensures consistent logging
/// behavior across the application.
abstract class Log {
  /// Log a verbose message.
  ///
  /// Used for detailed debugging information.
  void verbose(String message, {dynamic error, StackTrace? stackTrace});

  /// Log a debug message.
  ///
  /// Used for debugging information during development.
  void debug(String message, {dynamic error, StackTrace? stackTrace});

  /// Log an info message.
  ///
  /// Used for general information about application flow.
  void info(String message, {dynamic error, StackTrace? stackTrace});

  /// Log a warning message.
  ///
  /// Used for potentially harmful situations.
  void warning(String message, {dynamic error, StackTrace? stackTrace});

  /// Log an error message.
  ///
  /// Used for errors that should be investigated.
  void error(String message, {dynamic error, StackTrace? stackTrace});

  /// Shorthand for [verbose].
  void v(String message, {dynamic error, StackTrace? stackTrace}) =>
      verbose(message, error: error, stackTrace: stackTrace);

  /// Shorthand for [debug].
  void d(String message, {dynamic error, StackTrace? stackTrace}) =>
      debug(message, error: error, stackTrace: stackTrace);

  /// Shorthand for [info].
  void i(String message, {dynamic error, StackTrace? stackTrace}) =>
      info(message, error: error, stackTrace: stackTrace);

  /// Shorthand for [warning].
  void w(String message, {dynamic error, StackTrace? stackTrace}) =>
      warning(message, error: error, stackTrace: stackTrace);

  /// Shorthand for [error].
  void e(String message, {dynamic error, StackTrace? stackTrace}) =>
      this.error(message, error: error, stackTrace: stackTrace);

  /// Log a network error.
  ///
  /// Used to log detailed information about network-related errors.
  void logNetworkError(NetworkError error);

  /// Log a network request.
  ///
  /// Used to log outgoing network requests.
  void logNetworkRequest(RequestOptions request);

  /// Log a network response.
  ///
  /// Used to log incoming network responses.
  void logNetworkResponse(Response response);
}

/// Extension to provide easy access to a logger for any object.
///
/// This extension makes it simple to get a logger instance that automatically
/// includes the class name as a prefix in log messages.
extension LoggerExtension on Object {
  /// Get a logger instance for this object.
  ///
  /// The logger will automatically prefix all messages with the object's type name.
  Log get logger => PrefixLogger(
        runtimeType.toString(),
        LoggingFactory.provide(),
      );
}

/// Get a static logger instance.
///
/// Useful for logging from static contexts where object instances are not available.
Log get staticLogger => LoggingFactory.provide();

/// Factory class for creating and managing logger instances.
///
/// This class provides centralized control over logger creation and configuration.
/// It ensures that only one logger instance exists at a time and handles the
/// lifecycle of logger instances.
class LoggingFactory {
  static Log? _instance;

  /// Provides the current logger instance.
  ///
  /// Throws an exception if the logger hasn't been configured.
  static Log provide() {
    if (_instance == null) {
      throw Exception('Logger not configured');
    }
    return _instance!;
  }

  /// Configures the logger with the given configuration.
  ///
  /// Returns the configured logger instance.
  static Log configure(LoggingConfiguration configuration) {
    return resetWithLogger(configuration.isEnabled
        ? LoggerLogImpl(
            _makeLogger(configuration),
            logNetworkInfo: configuration.shouldLogNetworkInfo,
          )
        : VoidLogger());
  }

  /// Resets the logger with a new instance.
  ///
  /// Returns the new logger instance.
  static Log resetWithLogger(Log logger) {
    return _instance = logger;
  }

  /// Creates a new [Logger] instance based on the given configuration.
  static Logger _makeLogger(LoggingConfiguration configuration) {
    return Logger(
      printer: _makeLogPrinter(configuration),
      level: configuration.loggingLevel,
    );
  }

  /// Creates a new [LogPrinter] instance based on the given configuration.
  static LogPrinter _makeLogPrinter(LoggingConfiguration configuration) {
    return CustomLogPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      printEmojis: true,
      printTime: configuration.printTime,
    );
  }
}

/// A wrapper class that handles output wrapping for long log messages.
///
/// This class ensures that long log messages are properly wrapped to maintain
/// readability in the console output.
@visibleForTesting
class WrappingOutput extends LogOutput {
  final void Function(String) printer;

  /// Creates a new [WrappingOutput] instance.
  ///
  /// Parameters:
  /// - [printer]: A function that handles the actual printing of log messages
  WrappingOutput(this.printer);

  @override
  void output(OutputEvent event) {
    event.lines.forEach(_printWrapped);
  }

  /// Wraps long lines to ensure they don't exceed the maximum line length.
  void _printWrapped(String line) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(line).forEach((match) => printer(match.group(0)!));
  }
}

/// A wrapper class for the Logger package that implements the [Log] interface.
///
/// This class provides the main implementation of the logging functionality,
/// bridging between the application's logging interface and the underlying
/// logger package.
@visibleForTesting
class LoggerLogImpl extends Log {
  /// The underlying Logger instance.
  final Logger logger;

  /// Whether to log network-related information.
  final bool logNetworkInfo;

  /// Creates a new [LoggerLogImpl] instance.
  ///
  /// Parameters:
  /// - [logger]: The underlying Logger instance
  /// - [logNetworkInfo]: Whether to log network information
  LoggerLogImpl(
    this.logger, {
    required this.logNetworkInfo,
  });

  @override
  void debug(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void error(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void verbose(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.t(message, error: error, stackTrace: stackTrace);
  }

  @override
  void warning(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Logs network error information if network logging is enabled.
  ///
  /// This method formats and logs detailed information about network errors,
  /// including request and response details when available.
  @override
  void logNetworkError(NetworkError error) {
    if (!logNetworkInfo) return;

    final dioError = error;
    final message = StringBuffer();
    final response = dioError.response;
    final request = dioError.requestOptions;
    if (response == null) {
      message
        ..writeln('request | ${request.method} - url: ${request.uri}')
        ..writeln('message | ${dioError.message ?? ''}');
    } else {
      message
        ..writeln('response.data | ${response.data}')
        ..writeln('response.headers | ${response.headers}');
    }
    message.writeln(
        '<--------------- ${request.method} - url: ${request.uri} - status code: ${response?.statusCode ?? 'N/A'}');
    this.error(message.toString());
  }

  /// Logs outgoing network requests if network logging is enabled.
  ///
  /// This method logs basic information about HTTP requests before they are sent.
  @override
  void logNetworkRequest(RequestOptions request) {
    if (!logNetworkInfo) return;
    debug('---------------> ${request.method} - url: ${request.uri}');
  }

  /// Logs incoming network responses if network logging is enabled.
  ///
  /// This method logs basic information about HTTP responses when they are received.
  @override
  void logNetworkResponse(Response response) {
    if (!logNetworkInfo) return;
    debug(
        '<--------------- ${response.requestOptions.method} - url: ${response.requestOptions.uri} - status code: ${response.statusCode ?? 'N/A'}');
  }
}

/// A logger implementation that does nothing, used when logging is disabled.
///
/// This implementation is useful in production environments where logging should be
/// completely disabled for performance reasons.
@visibleForTesting
class VoidLogger implements Log {
  @override
  void d(String message, {error, StackTrace? stackTrace}) {}

  @override
  void debug(String message, {error, StackTrace? stackTrace}) {}

  @override
  void e(String message, {error, StackTrace? stackTrace}) {}

  @override
  void error(String message, {error, StackTrace? stackTrace}) {}

  @override
  void i(String message, {error, StackTrace? stackTrace}) {}

  @override
  void info(String message, {error, StackTrace? stackTrace}) {}

  @override
  void v(String message, {error, StackTrace? stackTrace}) {}

  @override
  void verbose(String message, {error, StackTrace? stackTrace}) {}

  @override
  void w(String message, {error, StackTrace? stackTrace}) {}

  @override
  void warning(String message, {error, StackTrace? stackTrace}) {}

  @override
  void logNetworkError(NetworkError error) {}

  @override
  void logNetworkRequest(RequestOptions request) {}

  @override
  void logNetworkResponse(Response<dynamic> response) {}
}

/// A logger that prefixes all messages with a given name.
///
/// This logger is particularly useful for class-specific logging, where you want
/// to easily identify the source of log messages.
@visibleForTesting
class PrefixLogger extends Log {
  /// The underlying logger instance.
  final Log _delegate;

  /// The prefix to add to all log messages.
  final String _name;

  /// Creates a new [PrefixLogger] instance.
  ///
  /// Parameters:
  /// - [name]: The prefix to add to all messages
  /// - [delegate]: The underlying logger to use
  @visibleForTesting
  PrefixLogger(this._name, this._delegate);

  @override
  void debug(String message, {error, StackTrace? stackTrace}) =>
      _delegate.debug('[$_name] $message', error: error, stackTrace: stackTrace);

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) =>
      _delegate.error('[$_name] $message', error: error, stackTrace: stackTrace);

  @override
  void info(String message, {error, StackTrace? stackTrace}) =>
      _delegate.info('[$_name] $message', error: error, stackTrace: stackTrace);

  @override
  void logNetworkError(NetworkError error) => _delegate.logNetworkError(error);

  @override
  void logNetworkRequest(RequestOptions request) =>
      _delegate.logNetworkRequest(request);

  @override
  void logNetworkResponse(Response<dynamic> response) =>
      _delegate.logNetworkResponse(response);

  @override
  void verbose(String message, {error, StackTrace? stackTrace}) =>
      _delegate.verbose('[$_name] $message', error: error, stackTrace: stackTrace);

  @override
  void warning(String message, {error, StackTrace? stackTrace}) =>
      _delegate.warning('[$_name] $message', error: error, stackTrace: stackTrace);
}
