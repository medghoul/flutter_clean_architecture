import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/constants/global_constants.dart';
import 'package:simeprofessional_mobileapp_flutter/cdbkr_lib/core/utils/validation/app_regex.dart';

/// A utility class for form field validation.
///
/// This class provides static methods for validating common form inputs
/// like email addresses, passwords, etc. using the underlying [AppRegex] class.
class FormValidators {
  /// Validates an email address.
  ///
  /// Returns an error message if the email is invalid, null otherwise.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci un indirizzo email';
    }
    if (!AppRegex.isEmailValid(value)) {
      return 'Inserisci un indirizzo email valido';
    }
    return null;
  }

  /// Validates a password with basic requirements.
  ///
  /// Returns an error message if the password doesn't meet the minimum requirements,
  /// null otherwise.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci una password';
    }
    if (value.length < GlobalConstants.minPasswordLength) {
      return 'La password deve contenere almeno ${GlobalConstants.minPasswordLength} caratteri';
    }
    return null;
  }

  /// Validates a password with strong security requirements.
  ///
  /// This validator enforces stricter password rules defined in [AppRegex.isPasswordValid].
  /// Returns an error message if the password doesn't meet requirements, null otherwise.
  static String? validateStrongPassword(String? value) {
    final basicCheck = validatePassword(value);
    if (basicCheck != null) {
      return basicCheck;
    }
    
    if (!AppRegex.isPasswordValid(value!)) {
      return 'La password deve contenere almeno una lettera maiuscola, '
          'una minuscola, un numero e un carattere speciale';
    }
    return null;
  }

  /// Validates a phone number.
  ///
  /// Returns an error message if the phone number is invalid, null otherwise.
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Inserisci un numero di telefono';
    }
    if (!AppRegex.isPhoneValid(value)) {
      return 'Inserisci un numero di telefono valido';
    }
    return null;
  }

  /// Validates required fields.
  ///
  /// Returns an error message if the field is empty, null otherwise.
  static String? validateRequired(String? value, {String fieldName = 'Campo'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName richiesto';
    }
    return null;
  }
} 