import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/widgets/ui/base_theme.dart';
import 'package:flutter/material.dart';

class ConfirmPwdTextFormField extends StatefulWidget {
  const ConfirmPwdTextFormField(
    this.confirmPasswordController,
    this.passwordController, {
    super.key,
    this.enabled = true,
    this.suffixIcon,
    this.obscureText,
  });
  final bool enabled;
  final TextEditingController? confirmPasswordController;
  final TextEditingController? passwordController;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  State<ConfirmPwdTextFormField> createState() => _ConfirmPwdTextFormFieldState();
}

class _ConfirmPwdTextFormFieldState extends State<ConfirmPwdTextFormField> {
  String? validateConfirmPwd() {
    if (widget.confirmPasswordController!.text.isEmpty) {
      //passwordFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.confirmPasswordController!.text != widget.passwordController!.text) {
      //passwordFocus.requestFocus();
      return translation.textFieldValidations.passwordsDontMatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.confirmPasswordController,
      obscureText: widget.obscureText ?? false,
      decoration: MyAppTheme.secondaryInputFieldStyle.copyWith(
        hintText: 'Conferma password',
        suffixIcon: widget.suffixIcon,
      ),
      validator: (_) => validateConfirmPwd(),
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
