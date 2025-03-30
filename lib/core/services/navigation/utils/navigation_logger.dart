part of '../navigation.dart';

mixin NavigationLogger {
  static final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: false,
      noBoxingByDefault: true,
      excludeBox: {
        Level.debug: true,
        Level.info: true,
        Level.warning: true,
      },
    ),
  );
  Logger get logger => _logger;
}