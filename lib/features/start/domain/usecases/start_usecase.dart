import '../repositories/start_repository.dart';

class StartUseCase {
  final StartRepository repository;

  StartUseCase(this.repository);

  Future<void> execute() async {
    return repository.someMethod();
  }
}