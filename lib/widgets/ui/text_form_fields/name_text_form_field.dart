import 'package:clean_architecture/extensions/context_extension.dart';
import 'package:clean_architecture/resources/res.dart';
import 'package:clean_architecture/resources/utils/validators.dart';
import 'package:clean_architecture/widgets/ui/base_theme.dart';
import 'package:flutter/material.dart';

class NameTextFormField extends StatefulWidget {
  const NameTextFormField(
    this.nameController, {
    super.key,
    this.enabled = true,
    this.suffixIcon,
  });
  final bool enabled;
  final TextEditingController? nameController;
  final Widget? suffixIcon;

  @override
  State<NameTextFormField> createState() => _NameTextFormFieldState();
}

class _NameTextFormFieldState extends State<NameTextFormField> {
  FocusNode nameFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      onEditingComplete: () {
        nameFocus.unfocus();
      },
      controller: widget.nameController,
      validator: (_) => Validators(context).validateName(widget.nameController!.text),
      textCapitalization: TextCapitalization.words,
      focusNode: nameFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: MyAppTheme.secondaryInputFieldStyle.copyWith(
        hintText: context.translate('textFormFieldHints.name'),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
