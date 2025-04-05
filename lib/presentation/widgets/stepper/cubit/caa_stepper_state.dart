import 'package:clean_architecture/presentation/widgets/stepper/models/caa_step.dart';
import 'package:equatable/equatable.dart';

enum CAAStepperStatus { initial, inProgress, completed, error }

enum CAAStepperType { registration }

class CAAStepperState extends Equatable {
  final List<CAAStep> steps;
  final int currentStepIndex;
  final CAAStepperStatus status;
  final CAAStepperType type;
  final String? errorMessage;

  const CAAStepperState({
    required this.steps,
    this.currentStepIndex = 0,
    this.status = CAAStepperStatus.initial,
    required this.type,
    this.errorMessage,
  });

  CAAStepperState copyWith({
    List<CAAStep>? steps,
    int? currentStepIndex,
    CAAStepperStatus? status,
    CAAStepperType? type,
    String? errorMessage,
  }) {
    return CAAStepperState(
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
