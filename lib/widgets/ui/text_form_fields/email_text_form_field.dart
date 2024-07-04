import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/resources/constants/constants.dart';
import 'package:clean_architecture/widgets/ui/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class EmailTextFormField extends StatefulWidget {
  final  TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  const EmailTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.onChanged,
  });


  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  FocusNode emailFocus = FocusNode();

  String? validateEmail() {
    if (widget.controller!.text.isEmpty) {
      emailFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.controller!.text.length > ProjectConst.EMAIL_TEXTFORMFIELD_MAX_LENGTH) {
      emailFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.EMAIL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    } else if (!isEmail(widget.controller!.text) && widget.controller!.text.isNotEmpty) {
      emailFocus.requestFocus();
      return translation.textFieldValidations.wrongCharacters;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      onEditingComplete: () {
        emailFocus.nextFocus();
      },
      onChanged: (text) {
        if (widget.controller!.text.endsWith(' ')) {
          widget.controller!.text = widget.controller!.text.replaceAll(RegExp(' '), '');
          widget.controller!.selection = TextSelection.fromPosition(
            TextPosition(offset: widget.controller!.text.length),
          );
        }
      },
      readOnly: widget.readOnly,
      controller: widget.controller,
      validator: (_) => validateEmail(),
      keyboardType: TextInputType.emailAddress,
      focusNode: emailFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: MyAppTheme.secondaryInputFieldStyle.copyWith(hintText: 'Email', suffixIcon: widget.suffixIcon),
    );
  }
}
