/// Utility class for common regex validations.
///
/// Provides pre-compiled regex patterns for various types of validations including:
/// - Email addresses
/// - Passwords (both standard and strong)
/// - Phone numbers
/// - Usernames
/// - URLs
/// - Dates
/// - Italian fiscal codes and VAT numbers
/// - Credit card numbers
/// - Basic text validations
class AppRegex {
  /// Pre-compiled regex pattern for email validation.
  ///
  /// Validates that:
  /// - Starts with valid characters (not dots or special chars)
  /// - Contains a single @ symbol
  /// - Has valid domain name
  /// - Has valid TLD
  /// - Doesn't allow consecutive special characters
  static final RegExp _emailRegex = RegExp(
    r'^(?![._-])'               // Don't start with special chars
    r'(?!.*[._-]{2})'          // No consecutive special chars
    r'[a-zA-Z0-9._-]+'         // Valid chars for local part
    r'@'                        // Single @ symbol
    r'[a-zA-Z0-9.-]+'          // Valid chars for domain
    r'\.'                       // Dot for TLD
    r'[a-zA-Z]{2,}$',          // TLD at least 2 chars
    caseSensitive: false,
    multiLine: false,
  );

  /// Pre-compiled regex pattern for password validation.
  ///
  /// Validates that password:
  /// - Is at least 8 characters long
  /// - Contains at least one uppercase letter
  /// - Contains at least one lowercase letter
  /// - Contains at least one number
  /// - Contains at least one special character
  static final RegExp _passwordRegex = RegExp(
    r'^'                        // Start of string
    r'(?=.*[a-z])'             // At least one lowercase
    r'(?=.*[A-Z])'             // At least one uppercase
    r'(?=.*\d)'                // At least one digit
    r'(?=.*[@$!%*?&])'         // At least one special char
    r'[A-Za-z\d@$!%*?&]'       // Only allowed chars
    r'{8,}$',                  // Minimum 8 chars
    caseSensitive: true,
    multiLine: false,
  );

  /// Pre-compiled regex for phone number validation.
  ///
  /// Validates international phone numbers following the E.164 format:
  /// - Optional + prefix
  /// - 1-15 digits
  /// - No spaces or special characters
  ///
  /// Example: +1234567890
  static final RegExp _phoneRegex = RegExp(
    r'^\+?[1-9]\d{1,14}$',     // International format (E.164)
    caseSensitive: false,
    multiLine: false,
  );

  /// Pre-compiled regex for username validation.
  ///
  /// Validates usernames that:
  /// - Are 3-20 characters long
  /// - Contain only letters, numbers, underscores, and hyphens
  /// - Are case sensitive
  static final RegExp _usernameRegex = RegExp(
    r'^[a-zA-Z0-9_-]{3,20}$',  // 3-20 chars, alphanumeric + _-
    caseSensitive: true,
    multiLine: false,
  );

  /// Pre-compiled regex for URL validation.
  ///
  /// Validates URLs that:
  /// - Start with http:// or https://
  /// - Optional www.
  /// - Valid domain name and TLD
  /// - Support subdomains
  static final RegExp _urlRegex = RegExp(
    r'^https?:\/\/'            // http:// or https://
    r'(?:www\.)?'             // Optional www.
    r'[a-zA-Z0-9-_]+'         // Domain name
    r'(?:\.[a-zA-Z0-9-_]+)*'  // Sub domains
    r'\.[a-zA-Z]{2,}',        // TLD
    caseSensitive: false,
    multiLine: false,
  );

  /// Pre-compiled regex for date validation.
  ///
  /// Validates dates in YYYY-MM-DD format:
  /// - Year: 4 digits
  /// - Month: 01-12
  /// - Day: 01-31
  static final RegExp _dateRegex = RegExp(
    r'^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$',
    caseSensitive: false,
    multiLine: false,
  );

  /// Pre-compiled regex for Italian fiscal code validation.
  ///
  /// Validates Italian fiscal codes following the standard format:
  /// - 6 letters (surname and name)
  /// - 2 digits (year of birth)
  /// - 1 letter (month of birth)
  /// - 2 digits (day of birth and gender)
  /// - 1 letter (place of birth)
  /// - 3 digits (progressive number)
  /// - 1 letter (control character)
  static final RegExp _codiceFiscaleRegex = RegExp(
    r'^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$',
    caseSensitive: true,
    multiLine: false,
  );

  /// Pre-compiled regex for Italian VAT number validation.
  ///
  /// Validates Italian VAT numbers (Partita IVA):
  /// - Exactly 11 digits
  static final RegExp _partitaIvaRegex = RegExp(
    r'^\d{11}$',
    caseSensitive: false,
    multiLine: false,
  );

  /// Pre-compiled regex for credit card number validation.
  ///
  /// Supports major credit card formats:
  /// - Visa (13 or 16 digits)
  /// - MasterCard (16 digits)
  /// - American Express (15 digits)
  /// - Discover (16 digits)
  static final RegExp _creditCardRegex = RegExp(
    r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|6(?:011|5[0-9]{2})[0-9]{12})$',
    caseSensitive: false,
    multiLine: false,
  );

  /// Pre-compiled regex for strong password validation.
  ///
  /// Validates that password has:
  /// - At least 2 uppercase letters
  /// - At least 1 special character (!@#$&*)
  /// - At least 2 digits
  /// - At least 3 lowercase letters
  /// - Minimum length of 10 characters
  static final RegExp _strongPasswordRegex = RegExp(
    r'^'                       // Start of string
    r'(?=.*[A-Z].*[A-Z])'     // At least 2 uppercase letters
    r'(?=.*[!@#$&*])'         // At least 1 special character
    r'(?=.*[0-9].*[0-9])'     // At least 2 digits
    r'(?=.*[a-z].*[a-z].*[a-z])' // At least 3 lowercase letters
    r'.{10,}$',               // At least 10 characters long
    caseSensitive: true,
    multiLine: false,
  );

  /// Validates an email address.
  ///
  /// Returns true if the email is valid according to common standards.
  /// 
  /// Example:
  /// ```dart
  /// print(AppRegex.isEmailValid('user@domain.com')); // true
  /// print(AppRegex.isEmailValid('invalid.email')); // false
  /// ```
  static bool isEmailValid(String email) => _emailRegex.hasMatch(email);

  /// Validates a password.
  ///
  /// Returns true if the password meets basic security requirements:
  /// - Minimum 8 characters
  /// - At least one uppercase letter
  /// - At least one lowercase letter
  /// - At least one number
  /// - At least one special character (@$!%*?&)
  static bool isPasswordValid(String password) => _passwordRegex.hasMatch(password);

  /// Validates a phone number in international format.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isPhoneValid('+1234567890')); // true
  /// print(AppRegex.isPhoneValid('invalid')); // false
  /// ```
  static bool isPhoneValid(String phone) => _phoneRegex.hasMatch(phone);

  /// Validates a username.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isUsernameValid('john_doe')); // true
  /// print(AppRegex.isUsernameValid('j')); // false (too short)
  /// ```
  static bool isUsernameValid(String username) => _usernameRegex.hasMatch(username);

  /// Validates a URL.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isUrlValid('https://example.com')); // true
  /// print(AppRegex.isUrlValid('invalid-url')); // false
  /// ```
  static bool isUrlValid(String url) => _urlRegex.hasMatch(url);

  /// Validates a date in YYYY-MM-DD format.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isDateValid('2024-02-21')); // true
  /// print(AppRegex.isDateValid('2024/02/21')); // false
  /// ```
  static bool isDateValid(String date) => _dateRegex.hasMatch(date);

  /// Validates an Italian fiscal code.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isCodiceFiscaleValid('RSSMRA80A01H501U')); // true
  /// ```
  static bool isCodiceFiscaleValid(String cf) => _codiceFiscaleRegex.hasMatch(cf);

  /// Validates an Italian VAT number.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isPartitaIvaValid('12345678901')); // true
  /// ```
  static bool isPartitaIvaValid(String piva) => _partitaIvaRegex.hasMatch(piva);

  /// Validates a credit card number.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isCreditCardValid('4111111111111111')); // true
  /// ```
  static bool isCreditCardValid(String cardNumber) => _creditCardRegex.hasMatch(cardNumber);

  /// Validates a strong password with enhanced security requirements.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isStrongPasswordValid('SecurePass123!@')); // true
  /// ```
  static bool isStrongPasswordValid(String password) => _strongPasswordRegex.hasMatch(password);

  /// Validates text contains only letters.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isOnlyLetters('Hello')); // true
  /// print(AppRegex.isOnlyLetters('Hello123')); // false
  /// ```
  static bool isOnlyLetters(String text) => 
      RegExp(r'^[a-zA-Z]+$').hasMatch(text);

  /// Validates text contains only numbers.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isOnlyNumbers('123')); // true
  /// print(AppRegex.isOnlyNumbers('123a')); // false
  /// ```
  static bool isOnlyNumbers(String text) => 
      RegExp(r'^[0-9]+$').hasMatch(text);

  /// Validates text is alphanumeric.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isAlphanumeric('Hello123')); // true
  /// print(AppRegex.isAlphanumeric('Hello_123')); // false
  /// ```
  static bool isAlphanumeric(String text) => 
      RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text);

  /// Validates hex color code.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isHexColor('#FF0000')); // true
  /// print(AppRegex.isHexColor('#XYZ')); // false
  /// ```
  static bool isHexColor(String color) => 
      RegExp(r'^#?([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$').hasMatch(color);

  /// Validates IPv4 address.
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isIPv4('192.168.1.1')); // true
  /// print(AppRegex.isIPv4('256.1.2.3')); // false
  /// ```
  static bool isIPv4(String ip) => RegExp(
    r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
  ).hasMatch(ip);

  /// Validates a time string in 24-hour format (HH:mm).
  ///
  /// Example:
  /// ```dart
  /// print(AppRegex.isTimeValid('23:59')); // true
  /// print(AppRegex.isTimeValid('24:00')); // false
  /// ```
  static bool isTimeValid(String time) => 
      RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$').hasMatch(time);
}
