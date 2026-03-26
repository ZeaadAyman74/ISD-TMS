import 'package:isd_tms/src/core/helpers/cache/cache_keys.dart';
import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref.dart';

class SharedPrefUtils {
  static Future<void> deleteAllData() async {
    await SharedPrefHelper.clear();
  }

  static Future<void> setOnBoarding(bool value) async {
    await SharedPrefHelper.setBool(CacheKeys.showOnBoarding, value);
  }

  static bool showOnBoarding() {
    return SharedPrefHelper.getBool(CacheKeys.showOnBoarding) ?? true;
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


  static Future<void> registerDevice() async {
    await SharedPrefHelper.setBool(CacheKeys.deviceRegistered, true);
  }

  static Future<void>unRegisterDevice()async{
    await SharedPrefHelper.setBool(CacheKeys.deviceRegistered, false);

  }
  static bool isDeviceRegistered() {
    bool registered= SharedPrefHelper.getBool(CacheKeys.deviceRegistered)??false;
    return registered;
  }

  static Future<void> setNotificationsCount(int count) async {
    await SharedPrefHelper.setInt(CacheKeys.notificationsCount, count);
  }
  static int get notificationsCount =>SharedPrefHelper.getInt(CacheKeys.notificationsCount) ?? 0;


  static Future<void>setDeviceSupportBadges(bool support)async{
    await SharedPrefHelper.setBool(CacheKeys.deviceSupportBadges, support);
  }

  static bool get deviceSupportBadges {
    return SharedPrefHelper.getBool(CacheKeys.deviceSupportBadges) ?? false;
  }
}
