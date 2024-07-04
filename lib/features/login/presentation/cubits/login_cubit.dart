import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/login/presentation/cubits/login_state.dart';
import 'package:flutter/material.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit()
      : super(LoginPageState(
    loginFormKey: GlobalKey<FormState>(),
    forgotPwdFormKey: GlobalKey<FormState>(),
  ));

  void setEmail(String email) {
    state.email?.text = email;
  }

  void setPassword(String password) {
    state.password?.text = password;
  }

  void toggleLoader() {
    emit(state.copyWith(showPageLoader: !state.showPageLoader));
  }

  void toggleShowPassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  Future<void> onLoginClick() async {
    if (state.loginFormKey.currentState?.validate() ?? false) {
      // Perform login logic
      toggleLoader();
      await Future.delayed(const Duration(seconds: 2)); // Simulate a network call
      toggleLoader();
    }
  }

  Future<void> onForgotPwdUserClick() async {
    if (state.forgotPwdFormKey.currentState?.validate() ?? false) {
      // Perform forgot password logic
      toggleLoader();
      await Future.delayed(const Duration(seconds: 2)); // Simulate a network call
      toggleLoader();
    }
  }
}
