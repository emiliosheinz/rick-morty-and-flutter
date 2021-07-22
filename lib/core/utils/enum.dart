import 'package:enum_to_string/enum_to_string.dart';

class EnumUtils {
  /// Can return a enum object or Null if the object is not found
  static fromString(List enumValues, String enumString) {
    return EnumToString.fromString(enumValues, enumString);
  }

  static String toShortString(enumValue) {
    return enumValue.toString().split('.').last;
  }
}
