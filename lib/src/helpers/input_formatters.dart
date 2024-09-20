import 'package:flutter/services.dart';

class InputFormatters {
  static final twoDecimalPlacesFormatter = FilteringTextInputFormatter.allow(
    RegExp(r'^\d*\.?\d{0,2}'),
  );
}
