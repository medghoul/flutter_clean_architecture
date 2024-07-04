import 'package:clean_architecture/i18n/translations.dart';
import 'package:flutter/material.dart';

class ConfirmNewPwdTextFormField extends StatefulWidget {
  const ConfirmNewPwdTextFormField(
    this.confirmNewPasswordController,
    this.passwordController, {
    super.key,
    this.enabled = true,
    this.suffixIcon,
    this.obscureText,
  });
  final bool enabled;
  final TextEditingController? confirmNewPasswordController;
  final TextEditingController? passwordController;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  State<ConfirmNewPwdTextFormField> createState() => _ConfirmNewPwdTextFormFieldState();
}

class _ConfirmNewPwdTextFormFieldState extends State<ConfirmNewPwdTextFormField> {
  String? validateConfirmNewPwd() {
    if (widget.confirmNewPasswordController!.text.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.confirmNewPasswordController!.text != widget.passwordController!.text) {
      return translation.textFieldValidations.passwordsDontMatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.confirmNewPasswordController,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        hintText: translation.textFormFieldHints.confirmNewPassword,
        suffixIcon: widget.suffixIcon,
      ),
      validator: (_) => validateConfirmNewPwd(),
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
