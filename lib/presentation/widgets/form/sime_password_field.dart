import 'package:flutter/material.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/app_colors.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/global_constants.dart';
import 'package:simeprofessional_mobileapp_flutter/core/responsive/index.dart';
import 'package:simeprofessional_mobileapp_flutter/presentation/widgets/form/sime_text_field.dart';

class SimePasswordField extends StatefulWidget {
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

  const SimePasswordField({
    Key? key,
    this.controller,
    this.labelText = 'Password',
    this.hintText = 'Inserisci la tua password',
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.enabled = true,
    this.textInputAction,
  }) : super(key: key);

  @override
  State<SimePasswordField> createState() => _SimePasswordFieldState();
}

class _SimePasswordFieldState extends State<SimePasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SimeTextField(
      controller: widget.controller,
      labelText: widget.labelText,
      hintText: widget.hintText,
      prefixIcon: Icons.lock_outline,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword ? Icons.visibility_off : Icons.visibility,
          color: AppColors.grey400,
          size: GlobalConstants.iconM.w,
        ),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
      obscureText: _obscurePassword,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      contentPadding: EdgeInsets.symmetric(
        horizontal: GlobalConstants.paddingL.w,
        vertical: GlobalConstants.paddingM.h,
      ),
    );
  }
}
