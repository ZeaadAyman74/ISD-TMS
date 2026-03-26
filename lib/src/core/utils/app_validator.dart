class AppFormValidator {
  static String? requiredField(String? value, String message) {
    if (value?.isEmpty ?? true) return message;
    return null;
  }

  static bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
        caseSensitive: false,
        multiLine: false);
    return emailRegex.hasMatch(email.trim());
  }

  static bool isLinkValid(String link) {
    final RegExp linkRegex = RegExp(
      r'^(https?:\/\/)?([a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+)(\/[^\s]*)?$',
      caseSensitive: false,
      multiLine: false,
    );
    return linkRegex.hasMatch(link.trim());
  }

  static bool isValidMobileNumber(String input) {
    RegExp mobileNumberRegExp = RegExp(r'^(01[0-9]{9}|1[0-9]{9})$');
    return mobileNumberRegExp.hasMatch(input);
  }

  static bool isDateValid(String? date) {
    if (date == null || date.isEmpty) return true;
    final RegExp reg = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    return reg.hasMatch(date);
  }

  static String? dateValidation(String? date, String message) {
    return (date == null || date.isEmpty || isDateValid(date)) ? null : message;
  }

  static String? emailValidation(String? email, String message) {
    if (!isEmailValid(email!)) return message;
    return null;
  }


  static String? confirmPassword(
      String? confirmPassword, String password, String message) {
    if (confirmPassword != password) return message;
    return null;
  }

  static String extractDate(String dateTimeString) {
    List<String> parts = dateTimeString.split('T');
    return parts.isNotEmpty ? parts[0] : dateTimeString;
  }
}
