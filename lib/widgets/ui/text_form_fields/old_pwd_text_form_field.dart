import 'package:clean_architecture/core/extensions/context_extension.dart';
import 'package:clean_architecture/core/resources/res.dart';
import 'package:clean_architecture/core/resources/utils/validators.dart';
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


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.oldPasswordController,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        hintText: context.translate('textFormFieldHints.insertOldPassword'),
        suffixIcon: widget.suffixIcon,
      ),
      validator: (_) => Validators(context).validateOldPassword(widget.oldPasswordController!.text),
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
