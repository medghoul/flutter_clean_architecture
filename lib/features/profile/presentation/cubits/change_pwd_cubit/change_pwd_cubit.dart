import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/profile/presentation/cubits/change_pwd_cubit/change_pwd_state.dart';
import 'package:flutter/material.dart';

class ChangePwdCubit extends Cubit<ChangePwdState> {
  ChangePwdCubit()
      : super(ChangePwdState(
    formKey: GlobalKey<FormState>(),
  ));

  void onShowOldPasswordPressed() {
    emit(state.copyWith(showOldPassword: !state.showOldPassword));
  }

  void onShowNewPasswordPressed() {
    emit(state.copyWith(showNewPassword: !state.showNewPassword));
  }

  void onShowConfirmNewPasswordPressed() {
    emit(state.copyWith(showConfirmNewPassword: !state.showConfirmNewPassword));
  }

  void resetPasswordFields() {
    emit(state.copyWith(oldPwd: null, newPwd: null, confirmNewPwd: null));
  }

  Future<void> pwdReset(BuildContext context) async {
    if (state.formKey.currentState?.validate() ?? false) {
      // Perform password reset logic
    }
  }
}
