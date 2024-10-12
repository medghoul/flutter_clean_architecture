
import 'package:clean_architecture/core/extensions/context_extension.dart';
import 'package:clean_architecture/i18n/lang_keys.dart';
import 'package:clean_architecture/core/resources/utils/validators.dart';
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      onEditingComplete: () {
        surnameFocus.unfocus();
      },
      controller: widget.surnameController,
      validator: (_) => Validators(context).validateSurname(widget.surnameController!.text),
      textCapitalization: TextCapitalization.words,
      focusNode: surnameFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: MyAppTheme.secondaryInputFieldStyle.copyWith(
        hintText: context.translate(LangKeys.surname),
        suffixIcon: const Icon(Icons.person),
      ),
    );
  }
}
