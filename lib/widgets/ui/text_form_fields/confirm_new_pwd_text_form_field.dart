import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/resources/utils/validators.dart';
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
      validator: (_) => Validators.validateConfirmPassword(widget.confirmNewPasswordController!.text, widget.passwordController!.text),
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
