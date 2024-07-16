import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/resources/constants/constants.dart';
import 'package:validators/validators.dart';

class Validators {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (!isEmail(email)) {
      return translation.textFieldValidations.wrongCharacters;
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (password.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return translation.textFieldValidations.maxLenght.replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    } else if (password.length < 8) {
      return 'La password deve essere superiore a 7 caratteri';
    }
    return null;
  }

  static String? validateOldPassword(String password) {
    if (password.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (password.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return translation.textFieldValidations.maxLenght.replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (confirmPassword != password) {
      return translation.textFieldValidations.passwordsDontMatch;
    }
    return null;
  }

  static String? validateConfirmEmail(String email, String confirmEmail) {
    if (confirmEmail.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (confirmEmail != email) {
      return translation.textFieldValidations.emailsDontMatch;
    }
    return null;
  }

  static String? validateSurname(String surname) {
    if (surname.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (surname.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return translation.textFieldValidations.maxLenght.replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  static String? validateName(String name) {
    if (name.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (name.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return translation.textFieldValidations.maxLenght.replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  static String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (phoneNumber.length > ProjectConst.PHONE_NUMBER_TEXTFORMFIELD_MAX_LENGTH) {
      return translation.textFieldValidations.maxLenght.replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.PHONE_NUMBER_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  static String? validateVatNumber(String vatNumber) {
    if (vatNumber.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (vatNumber.length > ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      return translation.textFieldValidations.maxLenght.replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }

  static String? validateFiscalCode(String fiscalCode) {
    if (fiscalCode.isEmpty) {
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (fiscalCode.length > ProjectConst.FISCAL_CODE_TEXTFORMFIELD_MAX_LENGTH) {
      return translation.textFieldValidations.maxLenght.replaceAll(
        RegExp(ProjectConst.PLACEHOLDER),
        ProjectConst.FISCAL_CODE_TEXTFORMFIELD_MAX_LENGTH.toString(),
      );
    }
    return null;
  }


}
