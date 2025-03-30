import 'package:cdbkr_boilerplate/localization/i18n/cdbkr_locale.dart';
import 'package:cdbkr_boilerplate/core/services/logger/logger.dart';
import 'package:cdbkr_boilerplate/core/structures/enums/prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for managing application preferences using SharedPreferences.
///
/// This service provides type-safe access to stored preferences organized by groups:
/// - [PrefsGroups.app]: Application settings (locale, theme)
/// - [PrefsGroups.session]: Session data (token, refresh token)
/// - [PrefsGroups.user]: User data (email, password)
class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  late SharedPreferences _sharedPreferences;

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._internal();

  /// Initializes the SharedPreferences instance.
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    logger.d('Shared Preferences initialized');
  }

  /// Gets a value from SharedPreferences with type safety.
  T? getValue<T>(PrefsKeys key, [T? defaultValue]) {
    try {
      final value = _sharedPreferences.get(key.key);
      if (value == null) return defaultValue;

      // Handle special cases
      if (key == PrefsKeys.locale) {
        return CdbkrLocale.values.firstWhere(
          (locale) => locale.name == value,
          orElse: () => CdbkrLocale.enUS,
        ) as T;
      }

      return value as T;
    } catch (e) {
      logger.e('Error getting value for key ${key.key}: $e');
      return defaultValue;
    }
  }

  /// Sets a value in SharedPreferences with type safety.
  Future<bool> setValue<T>(PrefsKeys key, T value) async {
    try {
      if (value is String) {
        return await _sharedPreferences.setString(key.key, value);
      } else if (value is int) {
        return await _sharedPreferences.setInt(key.key, value);
      } else if (value is double) {
        return await _sharedPreferences.setDouble(key.key, value);
      } else if (value is bool) {
        return await _sharedPreferences.setBool(key.key, value);
      } else if (value is List<String>) {
        return await _sharedPreferences.setStringList(key.key, value);
      } else if (value is CdbkrLocale) {
        return await _sharedPreferences.setString(key.key, value.name);
      }
      throw UnsupportedError('Type ${T.toString()} not supported');
    } catch (e) {
      logger.e('Error setting value for key ${key.key}: $e');
      return false;
    }
  }

  /// Removes a value from SharedPreferences.
  Future<bool> removeValue(PrefsKeys key) async {
    try {
      return await _sharedPreferences.remove(key.key);
    } catch (e) {
      logger.e('Error removing value for key ${key.key}: $e');
      return false;
    }
  }

  /// Clears all stored preferences.
  Future<bool> clearAll() async {
    try {
      return await _sharedPreferences.clear();
    } catch (e) {
      logger.e('Error clearing all preferences: $e');
      return false;
    }
  }

  /// Removes all preferences in a specific group
  Future<void> clearGroup(PrefsGroup group) async {
    try {
      final keysToRemove = PrefsKeys.values
          .where((key) => key.group == group)
          .map((key) => key.key);
      
      for (final key in keysToRemove) {
        await _sharedPreferences.remove(key);
      }
      logger.d('Cleared preferences group: ${group.name}');
    } catch (e) {
      logger.e('Error clearing group ${group.name}: $e');
    }
  }

  /// Checks if a specific key exists
  bool hasKey(PrefsKeys key) => _sharedPreferences.containsKey(key.key);
}
