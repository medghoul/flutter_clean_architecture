import '../repositories/logger_repository.dart';

class CopyLogsToClipboard {
  final LoggerRepository repository;

  CopyLogsToClipboard(this.repository);

  void call() {
    repository.copyLogsToClipboard();
  }
}
