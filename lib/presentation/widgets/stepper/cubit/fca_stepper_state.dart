import 'package:clean_architecture/presentation/widgets/stepper/models/fca_step.dart';
import 'package:equatable/equatable.dart';

enum FCAStepperStatus { initial, inProgress, completed, error }

enum FCAStepperType { registration }

class FCAStepperState extends Equatable {
  final List<FCAStep> steps;
  final int currentStepIndex;
  final FCAStepperStatus status;
  final FCAStepperType type;
  final String? errorMessage;

  const FCAStepperState({
    required this.steps,
    this.currentStepIndex = 0,
    this.status = FCAStepperStatus.initial,
    required this.type,
    this.errorMessage,
  });

  FCAStepperState copyWith({
    List<FCAStep>? steps,
    int? currentStepIndex,
    FCAStepperStatus? status,
    FCAStepperType? type,
    String? errorMessage,
  }) {
    return FCAStepperState(
      steps: steps ?? this.steps,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      status: status ?? this.status,
      type: type ?? this.type,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [steps, currentStepIndex, status, type, errorMessage];
}
