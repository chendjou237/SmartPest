class CommonUtil {
  static RegExp _emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  static bool isValidEmail(String email) {
    return _emailRegex.hasMatch(email);
  }
}
