import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/resources/res.dart';
import 'package:clean_architecture/widgets/ui/base_theme.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField(
    this.passwordController, {
    super.key,
    this.enabled = true,
    this.suffixIcon,
    this.obscureText,
    this.isAutoFocusEnabled = true,
    this.hintText,
  });
  final bool enabled;
  final TextEditingController? passwordController;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool isAutoFocusEnabled;
  final String? hintText;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  FocusNode newPasswordFocus = FocusNode();

  String? validatePwd() {
    if (widget.passwordController!.text.isEmpty) {
      if (widget.isAutoFocusEnabled) newPasswordFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.passwordController!.text.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      if (widget.isAutoFocusEnabled) newPasswordFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    } else if (widget.passwordController!.text.length < 8) {
      return 'La password deve essere superiore a 7 caratteri';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.passwordController,
      obscureText: widget.obscureText ?? false,
      decoration: MyAppTheme.secondaryInputFieldStyle.copyWith(hintText: 'Password', suffixIcon: widget.suffixIcon),
      validator: (_) => validatePwd(),
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
