import 'package:enum_to_string/enum_to_string.dart';

class EnumUtils {
  static fromString(List enumValues, String enumString) {
    return EnumToString.fromString(enumValues, enumString);
  }

  static String toShortString(enumValue) {
    return enumValue.toString().split('.').last;
  }
}
