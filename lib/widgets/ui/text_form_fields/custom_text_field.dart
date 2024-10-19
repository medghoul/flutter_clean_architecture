import 'package:flutter/material.dart';
import 'package:clean_architecture/widgets/ui/base_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextCapitalization textCapitalization;
  final AutovalidateMode autovalidateMode;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onTap,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      keyboardType: keyboardType,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
      decoration: MyAppTheme.secondaryInputFieldStyle.copyWith(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}