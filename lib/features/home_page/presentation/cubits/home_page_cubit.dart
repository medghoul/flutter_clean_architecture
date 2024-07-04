import 'package:bloc/bloc.dart';
import '../../domain/usecases/home_page_usecase.dart';

class HomePageCubit extends Cubit<void> {
  final HomePageUseCase useCase;

  HomePageCubit(this.useCase) : super(null);

  void someAction() {
    useCase.execute();
  }
}