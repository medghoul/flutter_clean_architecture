import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simeprofessional_mobileapp_flutter/presentation/widgets/stepper/cubit/sime_stepper_state.dart';
import 'package:simeprofessional_mobileapp_flutter/presentation/widgets/stepper/models/sime_step.dart';

class SimeStepperCubit extends Cubit<SimeStepperState> {
  SimeStepperCubit(
      {required SimeStepperType type, required List<SimeStep> steps})
      : super(SimeStepperState(type: type, steps: steps));

  /// Inizializza lo stepper in stato iniziale senza avviare il processo
  void initStepper() {
    final steps = List<SimeStep>.from(state.steps);

    // Reset all steps to initial state
    for (int i = 0; i < steps.length; i++) {
      steps[i] = steps[i].copyWith(
        isCompleted: false,
        inProgress: false,
        inError: false,
      );
    }

    emit(state.copyWith(
      steps: steps,
      currentStepIndex: 0,
      status: SimeStepperStatus.initial,
    ));
  }

  /// Passa allo step successivo
  bool goToNextStep() {
    if (state.currentStepIndex < state.steps.length - 1) {
      final steps = List<SimeStep>.from(state.steps);
      
      // Marca lo step corrente come completato
      steps[state.currentStepIndex] = steps[state.currentStepIndex].copyWith(
        isCompleted: true,
        inProgress: false,
      );
      
      // Marca il prossimo step come in progress
      final nextIndex = state.currentStepIndex + 1;
      steps[nextIndex] = steps[nextIndex].copyWith(
        inProgress: true,
        isCompleted: false,
        inError: false,
      );
      
      emit(state.copyWith(
        steps: steps,
        currentStepIndex: nextIndex,
        status: SimeStepperStatus.inProgress,
      ));
      
      return true;
    }
    return false;
  }
  
  /// Torna allo step precedente
  bool goToPreviousStep() {
    if (state.currentStepIndex > 0) {
      final steps = List<SimeStep>.from(state.steps);
      
      // Marca lo step corrente come non completato e non in progress
      steps[state.currentStepIndex] = steps[state.currentStepIndex].copyWith(
        isCompleted: false,
        inProgress: false,
      );
      
      // Marca lo step precedente come in progress
      final prevIndex = state.currentStepIndex - 1;
      steps[prevIndex] = steps[prevIndex].copyWith(
        inProgress: true,
        isCompleted: false,
      );
      
      emit(state.copyWith(
        steps: steps,
        currentStepIndex: prevIndex,
        status: SimeStepperStatus.inProgress,
      ));
      
      return true;
    }
    return false;
  }
  
  /// Può andare avanti?
  bool canGoForward() {
    return state.currentStepIndex < state.steps.length - 1;
  }
  
  /// Può andare indietro?
  bool canGoBack() {
    return state.currentStepIndex > 0;
  }
  
  /// È all'ultimo step?
  bool isLastStep() {
    return state.currentStepIndex == state.steps.length - 1;
  }

  /// Completa il processo di registrazione
  void completeRegistration() {
    if (state.currentStepIndex == state.steps.length - 1) {
      final steps = List<SimeStep>.from(state.steps);
      
      // Marca l'ultimo step come completato
      steps[state.currentStepIndex] = steps[state.currentStepIndex].copyWith(
        isCompleted: true,
        inProgress: false,
      );
      
      emit(state.copyWith(
        steps: steps,
        status: SimeStepperStatus.completed,
      ));
    }
  }

  /// Imposta lo step corrente come "in error"
  void setStepError([String? errorMessage]) {
    if (state.currentStepIndex < state.steps.length) {
      final steps = List<SimeStep>.from(state.steps);
      steps[state.currentStepIndex] = steps[state.currentStepIndex].copyWith(
        inError: true,
        inProgress: false,
      );
      emit(state.copyWith(
        steps: steps,
        status: SimeStepperStatus.error,
        errorMessage: errorMessage,
      ));
    }
  }

  /// Resetta lo stepper allo stato iniziale
  void reset() {
    emit(state.copyWith(
      currentStepIndex: 0,
      status: SimeStepperStatus.initial,
      errorMessage: null,
      steps: state.steps
          .map((step) => step.copyWith(
                isCompleted: false,
                inProgress: false,
                inError: false,
              ))
          .toList(),
    ));
  }
}
