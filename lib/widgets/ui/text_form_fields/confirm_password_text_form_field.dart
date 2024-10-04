import 'package:clean_architecture/core/resources/utils/validators.dart';
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
      validator: (_) => Validators(context).validateConfirmPassword(widget.confirmPasswordController!.text, widget.passwordController!.text),
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
