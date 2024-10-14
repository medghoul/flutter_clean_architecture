import 'package:flutter/material.dart';

class LoginPageState {
  final GlobalKey<FormState> loginFormKey;
  final GlobalKey<FormState> forgotPwdFormKey;
  final bool showPageLoader;
  final bool showPassword;
  final TextEditingController email;
  final TextEditingController password;

  LoginPageState({
    required this.loginFormKey,
    required this.forgotPwdFormKey,
    this.showPageLoader = false,
    this.showPassword = true,
    TextEditingController? email,
    TextEditingController? password,
  })  : email = email ?? TextEditingController(),
        password = password ?? TextEditingController();

  LoginPageState copyWith({
    GlobalKey<FormState>? loginFormKey,
    GlobalKey<FormState>? forgotPwdFormKey,
    bool? showPageLoader,
    bool? showPassword,
    TextEditingController? email,
    TextEditingController? password,
  }) {
    return LoginPageState(
      loginFormKey: loginFormKey ?? this.loginFormKey,
      forgotPwdFormKey: forgotPwdFormKey ?? this.forgotPwdFormKey,
      showPageLoader: showPageLoader ?? this.showPageLoader,
      showPassword: showPassword ?? this.showPassword,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
