import 'package:logger/logger.dart';
import '../repositories/logger_repository.dart';

class AddLog {
  final LoggerRepository repository;

  AddLog(this.repository);

  void call(LogEvent logEvent) {
    repository.addLog(logEvent);
  }
}
