import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// A custom log printer that extends the base [LogPrinter] class to provide
/// formatted console output without the default box decorations.
///
/// This printer supports:
/// - Custom color schemes for different log levels
/// - Emoji indicators for log types
/// - Configurable stack trace formatting
/// - Time stamp inclusion
@visibleForTesting
@immutable
class CustomLogPrinter extends LogPrinter {
  /// Color mapping for different log levels.
  /// Each level is associated with a specific [AnsiColor] for console output.
  static final levelColors = {
    Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: const AnsiColor.none(),
    Level.info: const AnsiColor.fg(12),
    Level.warning: const AnsiColor.fg(208),
    Level.error: const AnsiColor.fg(196),
    Level.fatal: const AnsiColor.fg(199),
  };

  /// Emoji indicators for different log levels.
  /// Provides visual distinction between log types in the console.
  static final levelEmojis = {
    Level.trace: ' ',
    Level.debug: '🐛 ',
    Level.info: '💡 ',
    Level.warning: '⚠️ ',
    Level.error: '⛔ ',
    Level.fatal: '👾 ',
  };

  /// Regular expression to match stack trace lines on Android/iOS devices.
  /// Example match: "#1      Logger.log (package:logger/src/logger.dart:115:29)"
  static final _deviceStackTraceRegex = RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

  /// The starting index for stack trace output.
  /// Useful for skipping wrapper method calls in the stack trace.
  final int stackTraceBeginIndex;

  /// Number of method calls to show in a normal stack trace.
  final int methodCount;

  /// Number of method calls to show for error messages.
  final int errorMethodCount;

  /// Maximum line length before wrapping.
  final int lineLength;

  /// Whether to enable colored output.
  final bool colors;

  /// Whether to show emojis in the output.
  final bool printEmojis;

  /// Whether to include timestamps in log messages.
  final bool printTime;

  /// Creates a new [CustomLogPrinter] instance.
  ///
  /// Parameters:
  /// - [stackTraceBeginIndex]: Starting point in the stack trace (default: 0)
  /// - [methodCount]: Number of methods to show in normal stack trace (default: 2)
  /// - [errorMethodCount]: Number of methods to show in error stack trace (default: 8)
  /// - [lineLength]: Maximum characters per line (default: 120)
  /// - [colors]: Enable colored output (default: true)
  /// - [printEmojis]: Show emoji indicators (default: true)
  /// - [printTime]: Include timestamps (default: false)
  CustomLogPrinter({
    this.stackTraceBeginIndex = 0,
    this.methodCount = 2,
    this.errorMethodCount = 8,
    this.lineLength = 120,
    this.colors = true,
    this.printEmojis = true,
    this.printTime = false,
  });

  /// Processes and formats a log event into a list of strings.
  ///
  /// This method handles the main logging logic, including:
  /// - Message formatting
  /// - Stack trace processing
  /// - Error message handling
  /// - Timestamp inclusion
  ///
  /// Parameters:
  /// - [event]: The log event to process
  ///
  /// Returns a list of formatted strings ready for output.
  @override
  List<String> log(LogEvent event) {
    var messageStr = stringifyMessage(event.message);

    String? stackTraceStr;
    if (event.stackTrace == null) {
      if (methodCount > 0) {
        stackTraceStr = formatStackTrace(StackTrace.current, methodCount);
      }
    } else if (errorMethodCount > 0) {
      stackTraceStr = formatStackTrace(event.stackTrace, errorMethodCount);
    }

    var errorStr = event.error?.toString();

    String? timeStr;
    if (printTime) {
      timeStr = getTime();
    }

    return _formatAndPrint(
      event.level,
      messageStr,
      timeStr,
      errorStr,
      stackTraceStr,
    );
  }

  /// Formats a stack trace into a readable string.
  ///
  /// Parameters:
  /// - [stackTrace]: The stack trace to format
  /// - [methodCount]: Number of methods to include
  ///
  /// Returns a formatted stack trace string or null if empty.
  String? formatStackTrace(StackTrace? stackTrace, int methodCount) {
    var lines = stackTrace.toString().split('\n');
    if (stackTraceBeginIndex > 0 && stackTraceBeginIndex < lines.length - 1) {
      lines = lines.sublist(stackTraceBeginIndex);
    }
    var formatted = <String>[];
    var count = 0;
    for (var line in lines) {
      if (_discardDeviceStacktraceLine(line) || line.isEmpty) {
        continue;
      }
      formatted.add('#$count   ${line.replaceFirst(RegExp(r'#\d+\s+'), '')}');
      if (++count == methodCount) {
        break;
      }
    }

    if (formatted.isEmpty) {
      return null;
    } else {
      return formatted.join('\n');
    }
  }

  /// Determines if a stack trace line should be discarded.
  ///
  /// Used to filter out internal logger lines from the stack trace.
  bool _discardDeviceStacktraceLine(String line) {
    var match = _deviceStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    return match.group(2)!.startsWith('package:logger');
  }

  /// Generates a formatted timestamp string.
  ///
  /// Returns a string in the format "HH:mm:ss.mmm".
  String getTime() {
    String threeDigits(int n) => '$n'.padLeft(3, '0');
    String twoDigits(int n) => '$n'.padLeft(2, '0');

    var now = DateTime.now();
    var h = twoDigits(now.hour);
    var min = twoDigits(now.minute);
    var sec = twoDigits(now.second);
    var ms = threeDigits(now.millisecond);
    return '$h:$min:$sec.$ms';
  }

  /// Converts a message object to a string representation.
  ///
  /// Handles special formatting for Maps and Iterables using JSON encoding.
  String stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      var encoder = const JsonEncoder.withIndent('  ');
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }

  /// Gets the appropriate color for a log level.
  AnsiColor _getLevelColor(Level level) {
    if (colors) {
      return levelColors[level]!;
    } else {
      return const AnsiColor.none();
    }
  }

  /// Gets the appropriate background color for error messages.
  AnsiColor _getErrorColor(Level level) {
    if (colors) {
      if (level == Level.fatal) {
        return levelColors[Level.fatal]!.toBg();
      } else {
        return levelColors[Level.error]!.toBg();
      }
    } else {
      return const AnsiColor.none();
    }
  }

  /// Gets the emoji indicator for a log level.
  String _getEmoji(Level level) {
    if (printEmojis) {
      return levelEmojis[level]!;
    } else {
      return '';
    }
  }

  /// Formats and prints the final log message with all components.
  ///
  /// Handles the assembly of:
  /// - Level-specific formatting
  /// - Time prefix
  /// - Emoji indicators
  /// - Message content
  /// - Error messages
  /// - Stack traces
  List<String> _formatAndPrint(
    Level level,
    String message,
    String? time,
    String? error,
    String? stacktrace,
  ) {
    List<String> buffer = [];
    var color = _getLevelColor(level);
    final timeInfix = time != null ? '$time ' : '';

    final emoji = _getEmoji(level);
    for (final line in message.split('\n')) {
      buffer.add(color(' $timeInfix$emoji$line'));
    }

    if (error != null) {
      var errorColor = _getErrorColor(level);
      for (var line in error.split('\n')) {
        buffer.add((time == null ? '' : color(timeInfix)) +
            errorColor.resetForeground +
            errorColor(line) +
            errorColor.resetBackground);
      }
    }

    if (stacktrace != null) {
      for (var line in stacktrace.split('\n')) {
        buffer.add(color('$timeInfix$line'));
      }
    }
    return buffer;
  }
}
