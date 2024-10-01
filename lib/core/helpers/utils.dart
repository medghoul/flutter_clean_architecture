import 'dart:convert';

class Utils {
  /// decode json string
  static Map<String, dynamic> decodeJSON(String j) {
    return json.decode(j) as Map<String, dynamic>;
  }

  /// Flatten a nested map structure
  static Map<String, String> flattenMap(Map<String, dynamic> map, [String prefix = '']) {
    Map<String, String> result = {};
    map.forEach((key, value) {
      String newKey = prefix.isEmpty ? key : '$prefix.$key';
      if (value is Map<String, dynamic>) {
        result.addAll(flattenMap(value, newKey));
      } else if (value is List) {
        for (int i = 0; i < value.length; i++) {
          result.addAll(flattenMap({i.toString(): value[i]}, newKey));
        }
      } else {
        result[newKey] = value.toString();
      }
    });
    return result;
  }
}
