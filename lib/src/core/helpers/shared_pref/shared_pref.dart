import 'package:isd_tms/src/core/extensions/ui_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();
  static late SharedPreferences _prefs;

  static Future<void>init()async{
    _prefs=await SharedPreferences.getInstance();
  }

  // static Future<void>setupIosCache()async{
  //   if(Platform.isIOS){
  //     final isFirstLaunch = _prefs.getBool(CacheKeys.didRunBefore) != true;
  //     if (isFirstLaunch) {
  //       await SecureStorage.deleteAll();
  //       await _prefs.setBool(CacheKeys.didRunBefore, true);
  //     }
  //   }
  // }

  static T? getValue<T>(String key) {
    try {
      if (T == String) {
        return _prefs.getString(key) as T?;
      } else if (T == int) {
        return _prefs.getInt(key) as T?;
      } else if (T == bool) {
        return _prefs.getBool(key) as T?;
      } else if (T == double) {
        return _prefs.getDouble(key) as T?;
      } else if (T == List<String>) {
        return _prefs.getStringList(key) as T?;
      }
      // Add support for other types if needed (e.g., Json)
      else {
        printMe('ShredPreferencesHelper: Unsupported type: $T for key: $key');
        return null;
      }
    } catch (e) {
      printMe('ShredPreferencesHelper: Error getting value for key: $key. Error: $e');
      return null; // Consider throwing error.
    }
  }

  /// Sets a value in shared preferences for the given key.
  ///
  /// This is a generic method that can store values of any supported type.
  ///
  /// Example:
  /// ```dart
  /// ShredPreferencesHelper.setValue<String>('username', 'JohnDoe');
  /// ShredPreferencesHelper.setValue<int>('age', 30);
  /// ShredPreferencesHelper.setValue<bool>('isEnabled', true);
  /// ```
  ///
  /// Returns: A Future that completes when the value is successfully set.
  static Future<void> setValue<T>(String key, T value) async {
    try {
      if (value is String) {
        await _prefs.setString(key, value);
      } else if (value is int) {
        await _prefs.setInt(key, value);
      } else if (value is bool) {
        await _prefs.setBool(key, value);
      } else if (value is double) {
        await _prefs.setDouble(key, value);
      } else if (value is List<String>) {
        await _prefs.setStringList(key, value);
      } else {
        throw UnsupportedError('ShredPreferencesHelper: Unsupported type: ${value.runtimeType} for key: $key');
      }
    } catch (e) {
      printMe('ShredPreferencesHelper: Error setting value for key: $key. Error: $e'); // Log
      rethrow; // Re-throw the exception so the caller knows.
    }
  }

  /// Removes a value from shared preferences for the given key.
  ///
  /// Returns: A Future that completes when the value is successfully removed.
  static Future<void> removeValue(String key) async {
    await _prefs.remove(key);
  }

  /// Clears all values from shared preferences.
  ///
  /// Returns: A Future that completes when all values are successfully cleared.
  static Future<void> clear() async {
    await _prefs.clear();
  }
  // -----------------------------------------------------------------------
  // Convenience methods for specific data types
  // -----------------------------------------------------------------------

  // --- String ---
  /// Stores a string value in shared preferences.
  static Future<void> setString(String key, String value) async {
    return setValue<String>(key, value);
  }

  /// Retrieves a string value from shared preferences.
  static String? getString(String key) {
    return getValue<String>(key);
  }

  // --- Integer ---
  /// Stores an integer value in shared preferences.
  static Future<void> setInt(String key, int value) async {
    return setValue<int>(key, value);
  }

  /// Retrieves an integer value from shared preferences.
  static int? getInt(String key) {
    return getValue<int>(key);
  }

  // --- Boolean ---
  /// Stores a boolean value in shared preferences.
  static Future<void> setBool(String key, bool value) async {
    return setValue<bool>(key, value);
  }

  /// Retrieves a boolean value from shared preferences.
  static bool? getBool(String key) {
    return getValue<bool>(key);
  }

  // --- Double ---
  /// Stores a double value in shared preferences.
  static Future<void> setDouble(String key, double value) async {
    return setValue<double>(key, value);
  }

  /// Retrieves a double value from shared preferences.
  static double? getDouble(String key) {
    return getValue<double>(key);
  }

  // --- String List ---
  /// Stores a list of strings in shared preferences.
  static Future<void> setStringList(String key, List<String> value) async {
    return setValue<List<String>>(key, value);
  }

  /// Retrieves a list of strings from shared preferences.
  static List<String>? getStringList(String key) {
    return getValue<List<String>>(key);
  }
}