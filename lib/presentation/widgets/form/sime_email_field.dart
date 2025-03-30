import 'package:flutter/material.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/global_constants.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/utils/validation/form_validators.dart';
import 'package:simeprofessional_mobileapp_flutter/core/responsive/index.dart';
import 'package:simeprofessional_mobileapp_flutter/presentation/widgets/form/sime_text_field.dart';

class SimeEmailField extends StatelessWidget {
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

  const SimeEmailField({
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimeTextField(
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
