import 'package:hive_ce/hive.dart';
import 'package:isd_tms/src/core/helpers/hive/hive_keys.dart';
import 'package:isd_tms/src/features/auth/data/models/user_model.dart';

class HiveUtils {
  HiveUtils._();

  /// User Data ---
  static Future<void> setUser(UserModel user) async {
    await Hive.box<UserModel>(HiveKeys.userBox).put(HiveKeys.userKey, user);
  }

  static UserModel? get user =>
      Hive.box<UserModel>(HiveKeys.userBox).get(HiveKeys.userKey);

  static bool get isUserLoggedIn => user != null && token != null;

  static Future<void> deleteUser() async {
    await Hive.box<UserModel>(HiveKeys.userBox).delete(HiveKeys.userKey);
    await deleteToken();
  }

  /// Token ---
  static Future<void> setToken(String token) async {
    await Hive.box<dynamic>(HiveKeys.settingsBox)
        .put(HiveKeys.tokenKey, token);
  }

  static String? get token =>
      Hive.box<dynamic>(HiveKeys.settingsBox).get(HiveKeys.tokenKey);

  static Future<void> deleteToken() async {
    await Hive.box<dynamic>(HiveKeys.settingsBox).delete(HiveKeys.tokenKey);
  }

  /// Logout ---
  static Future<void> resetUserCache() async {
    await deleteUser();
  }
}
