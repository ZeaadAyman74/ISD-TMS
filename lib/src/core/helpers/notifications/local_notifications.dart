// import 'dart:async';
// import 'dart:convert';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:isd_tms/src/core/extensions/ui_extension.dart';
// import 'package:isd_tms/src/core/helpers/notifications/fcm.dart';
// import 'package:isd_tms/src/core/helpers/notifications/notifications_navigator.dart';
// import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';
//
//
// class LocalNotificationsServices {
//   LocalNotificationsServices._();
//
//   static const channelId = "1";
//
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//
//   ///* Initialize notification ----------------------------------------------------------------
//   static Future<void> init() async {
//
//     AndroidInitializationSettings androidInitializationSettings =
//     const AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const DarwinInitializationSettings iosInitializationSettings =
//     DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       defaultPresentAlert: false,
//       defaultPresentBadge: false,
//       defaultPresentSound: false,
//     );
//
//     InitializationSettings initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iosInitializationSettings,
//     );
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) {
//         ///* when tap on foreground notification
//         RemoteMessage message =
//         RemoteMessage.fromMap(jsonDecode(notificationResponse.payload!));
//         NotificationsNavigator.handleNotificationOnTap(message);
//       },
//       // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );
//
//     // initListeners();
//   }
//
//   ///* init Listener ----------------------------------------------------------------
//   static Future<void> initListeners() async {
//     await requestLocalNotificationsPermissions();
//     checkIfAppOpenFromTerminated();
//   }
//
//   //* Check If App Open From Terminated ------------------------------------------------------
//   static Future<void> checkIfAppOpenFromTerminated() async {
//     printMeLog('_checkIfAppOpenFromTerminated');
//     final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//     await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//     bool isAppOpenFromTerminated =
//         notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
//     printMeLog('isAppOpenFromTerminated: $isAppOpenFromTerminated');
//     if (isAppOpenFromTerminated) {
//       String? payload =
//           notificationAppLaunchDetails?.notificationResponse?.payload;
//       if (payload != null) {
//         // FirebaseNotification notification =
//         // FirebaseNotification.fromJson(jsonDecode(payload));
//         // printMeLog('notification: ${notification.toJson()}');
//         NotificationServices.hasNotifications = true;
//       }
//     } else {
//       NotificationServices.hasNotifications = false;
//     }
//   }
//
//   ///* notificationTapBackground ----------------------------------------------------------------
//   // @pragma('vm:entry-point')
//   // static void notificationTapBackground(
//   //     NotificationResponse notificationResponse) {
//   //   RemoteMessage message =
//   //   RemoteMessage.fromMap(jsonDecode(notificationResponse.payload!));
//   //   printMe(message);
//   //   NotificationsNavigator.handleNotificationOnTap(message);
//   // }
//
//   ///* Request Local Notification Permission ----------------------------------------------------------------
//   static Future<void> requestLocalNotificationsPermissions() async {
//     final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//     flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>();
//     final bool? isAllowed =
//     await androidImplementation?.requestNotificationsPermission();
//
//     printMeLog('Android Local Notification Permission: $isAllowed');
//   }
//
//   ///* Show Notification ----------------------------------------------------------------
//   static Future<void> showNotification({
//     required String title,
//     required String content,
//     String? payload,
//   }) async {
//     AndroidNotificationDetails androidNotificationDetails =
//     AndroidNotificationDetails(
//       channelId,
//       "coiffeur saleh",
//       channelDescription:
//       "This channel is responsible for all the local notifications",
//       styleInformation: BigTextStyleInformation(
//         content,
//         contentTitle: title,
//       ),
//       playSound: true,
//       priority: Priority.max,
//       importance: Importance.max,
//     );
//
//     DarwinNotificationDetails iosNotificationDetails =
//     DarwinNotificationDetails(
//         categoryIdentifier: "coiffeur",
//         badgeNumber: SharedPrefUtils.notificationsCount
//     );
//
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: iosNotificationDetails,
//     );
//
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       content,
//       notificationDetails,
//       payload: payload ?? '0',
//     );
//   }
//
//   static Future<void> cancelAllNotifications() async {
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }
//
//   static Future<void>cancelById(int id) async {
//     await flutterLocalNotificationsPlugin.cancel(id);
//   }
// }
//
//
