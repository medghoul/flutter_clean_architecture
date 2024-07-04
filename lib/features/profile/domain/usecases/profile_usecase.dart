import '../repositories/profile_repository.dart';

class ProfileUseCase {
  final ProfileRepository repository;

  ProfileUseCase(this.repository);

  Future<void> execute() async {
    return repository.someMethod();
  }
}