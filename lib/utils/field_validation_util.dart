class FieldValidationUtil {
  static String? validateValue(String value, String fieldName) {
    value = value.trim();

    if (value.isEmpty || value == "") {
      return "$fieldName cannot be empty";
    } else {
      return null;
    }
  }
}
