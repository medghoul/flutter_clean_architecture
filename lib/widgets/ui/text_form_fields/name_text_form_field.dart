import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/resources/res.dart';
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

  String? validateName() {
    if (widget.nameController!.text.isEmpty) {
      nameFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.nameController!.text.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      nameFocus.requestFocus();
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
      onEditingComplete: () {
        nameFocus.unfocus();
      },
      controller: widget.nameController,
      validator: (_) => validateName(),
      textCapitalization: TextCapitalization.words,
      focusNode: nameFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: MyAppTheme.secondaryInputFieldStyle.copyWith(
        hintText: translation.textFormFieldHints.name,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
