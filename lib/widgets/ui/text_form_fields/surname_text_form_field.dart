
import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/resources/res.dart';
import 'package:clean_architecture/widgets/ui/base_theme.dart';
import 'package:flutter/material.dart';

class SurnameTextFormField extends StatefulWidget {
  const SurnameTextFormField(
    this.surnameController, {
    super.key,
    this.enabled = true,
  });
  final bool enabled;
  final TextEditingController? surnameController;

  @override
  State<SurnameTextFormField> createState() => _SurnameTextFormFieldState();
}

class _SurnameTextFormFieldState extends State<SurnameTextFormField> {
  FocusNode surnameFocus = FocusNode();

  String? validateSurname() {
    if (widget.surnameController!.text.isEmpty) {
      surnameFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.surnameController!.text.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      surnameFocus.requestFocus();
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
        surnameFocus.unfocus();
      },
      controller: widget.surnameController,
      validator: (_) => validateSurname(),
      textCapitalization: TextCapitalization.words,
      focusNode: surnameFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: MyAppTheme.secondaryInputFieldStyle.copyWith(
        hintText: translation.textFormFieldHints.surname,
        suffixIcon: const Icon(Icons.person),
      ),
    );
  }
}
