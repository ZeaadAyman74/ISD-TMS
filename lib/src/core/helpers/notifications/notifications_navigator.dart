import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:isd_tms/src/core/router/router.main.dart';

class NotificationsNavigator {
  static void handleNotificationOnTap(RemoteMessage? message) {
    AppRouter.navigatorKey.currentState!.pushNamed('/');
  }
}
