import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/resources/res.dart';
import 'package:flutter/material.dart';

class OldPwdTextFormField extends StatefulWidget {
  const OldPwdTextFormField(
    this.oldPasswordController, {
    super.key,
    this.enabled = true,
    this.suffixIcon,
    this.obscureText,
  });
  final bool enabled;
  final TextEditingController? oldPasswordController;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  State<OldPwdTextFormField> createState() => _OldPwdTextFormFieldState();
}

class _OldPwdTextFormFieldState extends State<OldPwdTextFormField> {
  FocusNode oldPasswordFocus = FocusNode();

  String? validateOldPwd() {
    if (widget.oldPasswordController!.text.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.oldPasswordController!.text.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return translation.textFieldValidations.maxLenght.replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.oldPasswordController,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        hintText: translation.textFormFieldHints.insertOldPassword,
        suffixIcon: widget.suffixIcon,
      ),
      validator: (_) => validateOldPwd(),
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
