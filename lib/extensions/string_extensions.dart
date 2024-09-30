extension StringExtension on String {
  String capitalize() {
    return isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
  }

  String truncate(int maxLength) {
    return (length <= maxLength) ? this : '${substring(0, maxLength)}...';
  }

  String removeLastCharacter() {
    return isNotEmpty ? substring(0, length - 1) : this;
  }

  String removeFirstCharacter() {
    return isNotEmpty ? substring(1) : this;
  }

  String removeLastWord() {
    return isNotEmpty ? substring(0, lastIndexOf(' ')) : this;
  }

  String removeFirstWord() {
    return isNotEmpty ? substring(indexOf(' ') + 1) : this;
  }

  String removeAllSpaces() {
    return replaceAll(' ', '');
  }

   bool get isNullOrEmpty => this == null || isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool isValidEmail() {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  DateTime? toDateTime() {
    return DateTime.tryParse(this);
  }
}
