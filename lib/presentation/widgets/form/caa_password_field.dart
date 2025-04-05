import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:clean_architecture/core/responsive/index.dart';
import 'package:clean_architecture/presentation/widgets/form/index.dart';
import 'package:flutter/material.dart';

class CAAPasswordField extends StatefulWidget {
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

  const CAAPasswordField({
    super.key,
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
  });

  @override
  State<CAAPasswordField> createState() => _CAAPasswordFieldState();
}

class _CAAPasswordFieldState extends State<CAAPasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CAATextField(
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
