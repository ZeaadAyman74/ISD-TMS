import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:isd_tms/src/core/helpers/hive/hive_keys.dart';
import 'package:isd_tms/src/features/auth/data/models/user_model.dart';

class HiveInitializer {
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register Adapters
    Hive.registerAdapter(UserModelAdapter());

    // Open boxes
    await Hive.openBox<UserModel>(HiveKeys.userBox);
    await Hive.openBox<dynamic>(HiveKeys.settingsBox);
  }
}
