import 'package:flutter/cupertino.dart';

class ChangePwdState {
  final GlobalKey<FormState> formKey;
  final bool showOldPassword;
  final bool showNewPassword;
  final bool showConfirmNewPassword;
  final TextEditingController? oldPwd;
  final TextEditingController? newPwd;
  final TextEditingController? confirmNewPwd;

  ChangePwdState({
    required this.formKey,
    this.showOldPassword = false,
    this.showNewPassword = false,
    this.showConfirmNewPassword = false,
    this.oldPwd,
    this.newPwd,
    this.confirmNewPwd,
  });

  ChangePwdState copyWith({
    GlobalKey<FormState>? formKey,
    bool? showOldPassword,
    bool? showNewPassword,
    bool? showConfirmNewPassword,
    TextEditingController? oldPwd,
    TextEditingController? newPwd,
    TextEditingController? confirmNewPwd,
  }) {
    return ChangePwdState(
      formKey: formKey ?? this.formKey,
      showOldPassword: showOldPassword ?? this.showOldPassword,
      showNewPassword: showNewPassword ?? this.showNewPassword,
      showConfirmNewPassword: showConfirmNewPassword ?? this.showConfirmNewPassword,
      oldPwd: oldPwd ?? this.oldPwd,
      newPwd: newPwd ?? this.newPwd,
      confirmNewPwd: confirmNewPwd ?? this.confirmNewPwd,
    );
  }
}
