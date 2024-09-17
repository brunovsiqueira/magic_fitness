class ValidationHelpers {
  static String? validatePositiveDouble(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    final parsedValue = double.tryParse(value);
    if (parsedValue == null || parsedValue <= 0) {
      return 'Please enter a positive value';
    }
    return null;
  }

  static String? validatePositiveInteger(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    final parsedValue = int.tryParse(value);
    if (parsedValue == null || parsedValue <= 0) {
      return 'Please enter a positive integer';
    }
    return null;
  }
}
