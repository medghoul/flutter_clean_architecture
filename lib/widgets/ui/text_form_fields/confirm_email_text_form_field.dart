import 'package:clean_architecture/resources/utils/validators.dart';
import 'package:clean_architecture/widgets/ui/base_theme.dart';
import 'package:flutter/material.dart';

class ConfirmEmailTextFormField extends StatefulWidget {
  const ConfirmEmailTextFormField(
    this.confirmEmailController,
    this.emailController, {
    super.key,
    this.enabled = true,
    this.suffixIcon,
    this.obscureText,
  });
  final bool enabled;
  final TextEditingController? confirmEmailController;
  final TextEditingController? emailController;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  State<ConfirmEmailTextFormField> createState() => _ConfirmEmailTextFormFieldState();
}

class _ConfirmEmailTextFormFieldState extends State<ConfirmEmailTextFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.confirmEmailController,
      obscureText: widget.obscureText ?? false,
      decoration:
          MyAppTheme.secondaryInputFieldStyle.copyWith(hintText: 'Conferma email', suffixIcon: widget.suffixIcon),
      validator: (_) => Validators(context).validateConfirmEmail(widget.confirmEmailController!.text, widget.emailController!.text),
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
