import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:clean_architecture/core/responsive/index.dart';
import 'package:clean_architecture/core/utils/validation/form_validators.dart';
import 'package:clean_architecture/presentation/widgets/form/index.dart';
import 'package:flutter/material.dart';

class FCAEmailField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final bool enabled;
  final TextInputAction? textInputAction;

  const FCAEmailField({
    super.key,
    this.controller,
    this.labelText = 'Email',
    this.hintText = 'Inserisci la tua email',
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.enabled = true,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return FCATextField(
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: validator ?? FormValidators.validateEmail,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      focusNode: focusNode,
      enabled: enabled,
      textInputAction: textInputAction,
      contentPadding: EdgeInsets.symmetric(
        horizontal: GlobalConstants.paddingL.w,
        vertical: GlobalConstants.paddingM.h,
      ),
    );
  }
}
