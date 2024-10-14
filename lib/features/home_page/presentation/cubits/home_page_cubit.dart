
import 'package:clean_architecture/features/home_page/domain/usecases/home_page_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<void> {
  final HomePageUseCase useCase;

  HomePageCubit(this.useCase) : super(null);

  void someAction() {
    useCase.execute();
  }
}