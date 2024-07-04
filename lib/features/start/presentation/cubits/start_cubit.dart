import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/start/domain/usecases/start_usecase.dart';

class StartCubit extends Cubit<void> {
  final StartUseCase useCase;

  StartCubit(this.useCase) : super(null);

  void someAction() {
    useCase.execute();
  }
}
