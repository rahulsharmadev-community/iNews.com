abstract class TxtValiator {
  static String? email(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      bool isValid = RegExp(
              r"^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$")
          .hasMatch(value.trim());
      if (isValid) {
        return null;
      } else {
        return ' Please enter a valid email';
      }
    } else {
      return ' Field cannot be empty';
    }
  }
}
