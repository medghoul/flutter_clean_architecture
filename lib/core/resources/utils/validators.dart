import 'package:clean_architecture/core/resources/constants/constants.dart';
import 'package:clean_architecture/i18n/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:clean_architecture/core/extensions/context_extension.dart';

class Validators {
  late final BuildContext context;

  Validators(this.context);

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return context.translate(LangKeys.textFormFieldEmpty);
    } else if (!isEmail(email)) {
      return context.translate(LangKeys.wrongCharacters);
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return context.translate(LangKeys.textFormFieldEmpty);
    } else if (password.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return context.translate(LangKeys.maxLenght).replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    } else if (password.length < 8) {
      return 'La password deve essere superiore a 7 caratteri';
    }
    return null;
  }

  String? validateOldPassword(String password) {
    if (password.isEmpty) {
      return context.translate(LangKeys.textFormFieldEmpty);
    } else if (password.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return context.translate(LangKeys.maxLenght).replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return context.translate(LangKeys.textFormFieldEmpty);
    } else if (confirmPassword != password) {
      return context.translate(LangKeys.passwordsDontMatch);
    }
    return null;
  }

  String? validateConfirmEmail(String email, String confirmEmail) {
    if (confirmEmail.isEmpty) {
      return context.translate(LangKeys.textFormFieldEmpty);
    } else if (confirmEmail != email) {
      return context.translate(LangKeys.emailsDontMatch);
    }
    return null;
  }

  String? validateSurname(String surname) {
    if (surname.isEmpty) {
      return context.translate(LangKeys.textFormFieldEmpty);
    } else if (surname.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return context.translate(LangKeys.maxLenght).replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return context.translate(LangKeys.textFormFieldEmpty);
    } else if (name.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return context.translate(LangKeys.maxLenght).replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return context.translate(LangKeys.textFormFieldEmpty);
    } else if (phoneNumber.length > ProjectConst.PHONE_NUMBER_TEXTFORMFIELD_MAX_LENGTH) {
      return context.translate(LangKeys.maxLenght).replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.PHONE_NUMBER_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  String? validateVatNumber(String vatNumber) {
    if (vatNumber.isEmpty) {
      return context.translate(LangKeys.textFormFieldEmpty);
    } else if (vatNumber.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return context.translate(LangKeys.maxLenght).replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  String? validateFiscalCode(String fiscalCode) {
    if (fiscalCode.isEmpty) {
      return context.translate(LangKeys.textFormFieldEmpty);
    } else if (fiscalCode.length > ProjectConst.FISCAL_CODE_TEXTFORMFIELD_MAX_LENGTH) {
      return context.translate(LangKeys.maxLenght).replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.FISCAL_CODE_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }
}
