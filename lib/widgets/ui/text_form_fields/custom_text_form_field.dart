import 'package:flutter/material.dart';
import 'package:clean_architecture/resources/res.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onTap,
    this.onChanged,
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
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.textFormFieldRadius),
        ),
      ),
    );
  }
}
