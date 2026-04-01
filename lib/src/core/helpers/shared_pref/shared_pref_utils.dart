import 'package:isd_tms/src/core/helpers/cache/cache_keys.dart';
import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref.dart';

class SharedPrefUtils {
  static Future<void> deleteAllData() async {
    await SharedPrefHelper.clear();
  }

  static Future<void> setThemeMode(int modeIndex) async {
    SharedPrefHelper.setInt(CacheKeys.themeMode, modeIndex);
  }

  static int? get themeModeIndex =>
      SharedPrefHelper.getInt(CacheKeys.themeMode);

  static Future<void> setLocale(String locale) async {
    await SharedPrefHelper.setString(CacheKeys.locale, locale);
  }

  static String? get locale => SharedPrefHelper.getString(CacheKeys.locale);

  static Future<void> deleteLocale() async {
    await SharedPrefHelper.removeValue(CacheKeys.locale);
  }
}
