import 'package:clean_architecture/core/resources/res.dart';
import 'package:clean_architecture/core/resources/utils/validators.dart';
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.passwordController,
      obscureText: widget.obscureText ?? false,
      decoration: MyAppTheme.secondaryInputFieldStyle.copyWith(hintText: 'Password', suffixIcon: widget.suffixIcon),
      validator: (_) => Validators(context).validatePassword(widget.passwordController!.text),
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
