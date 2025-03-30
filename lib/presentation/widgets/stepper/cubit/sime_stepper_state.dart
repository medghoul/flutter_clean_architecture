import 'package:equatable/equatable.dart';
import 'package:simeprofessional_mobileapp_flutter/presentation/widgets/stepper/models/sime_step.dart';

enum SimeStepperStatus { initial, inProgress, completed, error }

enum SimeStepperType { registration }

class SimeStepperState extends Equatable {
  final List<SimeStep> steps;
  final int currentStepIndex;
  final SimeStepperStatus status;
  final SimeStepperType type;
  final String? errorMessage;

  const SimeStepperState({
    required this.steps,
    this.currentStepIndex = 0,
    this.status = SimeStepperStatus.initial,
    required this.type,
    this.errorMessage,
  });

  SimeStepperState copyWith({
    List<SimeStep>? steps,
    int? currentStepIndex,
    SimeStepperStatus? status,
    SimeStepperType? type,
    String? errorMessage,
  }) {
    return SimeStepperState(
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
