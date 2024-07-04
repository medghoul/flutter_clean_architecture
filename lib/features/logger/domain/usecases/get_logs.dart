import 'package:clean_architecture/features/logger/domain/repositories/logger_repository.dart';
import 'package:logger/logger.dart';

class GetLogs {
  final LoggerRepository repository;

  GetLogs(this.repository);

  List<LogEvent> call() {
    return repository.getLogs();
  }
}
