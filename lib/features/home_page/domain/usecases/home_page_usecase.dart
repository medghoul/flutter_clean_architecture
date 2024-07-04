import '../repositories/home_page_repository.dart';

class HomePageUseCase {
  final Home_pageRepository repository;

  HomePageUseCase(this.repository);

  Future<void> execute() async {
    return repository.someMethod();
  }
}