// import 'dart:convert';
// import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:isd_tms/src/core/extensions/ui_extension.dart';
// import 'package:isd_tms/src/core/helpers/notifications/local_notifications.dart';
// import 'package:isd_tms/src/core/helpers/notifications/notifications_navigator.dart';
// import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref.dart';
// import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';
// import 'package:isd_tms/src/core/utils/app_utils.dart';
// import 'package:isd_tms/src/core/utils/enums.dart';
//
// /// receive message when app is background
// @pragma('vm:entry-point')
// Future<void> _notificationsBackgroundHandler(RemoteMessage? message) async {
//   printMe("On notification received in background -----> ${message?.toMap()}");
//
//   if (message != null) {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();
//     await SharedPrefHelper.init();
//
//     // Increment notification count in SharedPreferences
//     final newCount = SharedPrefUtils.notificationsCount + 1;
//     await SharedPrefUtils.setNotificationsCount(newCount);
//
//     // Update app badge
//     // if (SharedPrefUtils.deviceSupportBadges) {
//     //   AppBadgePlus.updateBadge(newCount);
//     // }
//
//     // Try to send the new count to the main isolate
//     // final SendPort? mainIsolateSendPort = IsolateNameServer.lookupPortByName(notificationsIsolatePortName);
//     // if (mainIsolateSendPort != null) {
//     //   mainIsolateSendPort.send(newCount);
//     //   printMe("Sent new count ($newCount) to main isolate.");
//     // } else {
//     //   printMe("Main isolate port not found. UI will not update from background.");
//     // }
//
//     // NotificationsNavigator.handleNotificationOnTap(message); // If you have this
//   }
// }
//
// class NotificationServices {
//   NotificationServices._();
//
//   static RemoteMessage? notificationMessage;
//   static bool? hasNotifications;
//   static final _firebaseMessaging = FirebaseMessaging.instance;
//
//   ///* Initialize notification with permission
//
//   static Future init() async {
//     try {
//       bool isPermissionAllowed =
//       await NotificationServices.isPermissionAllowed();
//       if (isPermissionAllowed) {
//         printMeLog('Notifications Permission Allowed');
//         await LocalNotificationsServices.init();
//
//         initListener();
//       } else {
//         printMeLog('Notifications Permission Not Allowed');
//         bool isPermissionAllowed = await requestPermission();
//         if (isPermissionAllowed) {
//           printMeLog('Permission Allowed 2');
//           await LocalNotificationsServices.init();
//
//           initListener();
//         }
//       }
//       // SharedPrefUtils.setDeviceSupportBadges(await AppBadgePlus.isSupported());
//     } catch (e) {
//       Utils.showToast(e.toString(), ToastStates.error);
//     }
//   }
//
//   ///* Check is has permission
//   static Future<bool> isPermissionAllowed() async {
//     NotificationSettings settings =
//     await _firebaseMessaging.getNotificationSettings();
//
//     return settings.authorizationStatus == AuthorizationStatus.authorized;
//   }
//
//   ///* Check is has permission
//   static Future<bool> requestPermission() async {
//     try {
//       NotificationSettings settings =
//       await _firebaseMessaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         provisional: false,
//         carPlay: false,
//         sound: true,
//       );
//       return settings.authorizationStatus == AuthorizationStatus.authorized;
//     } catch (e) {
//       printMeLog("requestPermissionError: $e");
//       return false;
//     }
//   }
//
//   ///* Init listen notification
//   static Future<void> initListener() async {
//     try {
//       //* On notification received [foreground]
//       FirebaseMessaging.onMessage.listen((message) async {
//         try {
//           if (message.notification != null && Platform.isAndroid) {
//             await LocalNotificationsServices.showNotification(
//               title: message.notification?.title ?? "",
//               content: message.notification?.body ?? "",
//               payload: json.encode(message.toMap()),
//             );
//           }
//           // await userNotificationsNotifier
//           //     .increaseNotificationsCount();
//         } catch (e) {
//           printMeLog('------------- Platform.isAndroid error');
//         }
//
//         printMeLog(
//             "On notification received [foreground] -----> ${message.toMap()}");
//         printMeLog('--------------------------------------------------');
//       });
//
//       //* On notification opened from [background]
//       FirebaseMessaging.onMessageOpenedApp.listen((message) {
//         NotificationsNavigator.handleNotificationOnTap(message);
//         printMeLog(
//             "On notification opened from [background] -----> ${message.toMap()}");
//       });
//
//       //* On notification received in background
//       FirebaseMessaging.onBackgroundMessage(_notificationsBackgroundHandler);
//
//       //* Get Tapped notification Message Then Opened App From [Terminated]
//       _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
//         if (message != null) {
//           NotificationsNavigator.handleNotificationOnTap(message);
//         }
//       }).catchError((error) {
//         printMeLog('getInitialMessageError: $error');
//       });
//
//       await _firebaseMessaging.setForegroundNotificationPresentationOptions(
//           alert: true, badge: true, sound: true);
//     } catch (e) {
//       printMe("initListener -----> $e");
//     }
//   }
//
//   //----------------------------------------------------------------------------
//
//   ///* Get [FCM] token
//   static Future<String> getFCMToken() async {
//     try {
//       String token = await _firebaseMessaging.getToken() ?? "Token";
//       printMe("FCM Token -----> $token");
//       return token;
//     } catch (error) {
//       return 'Token';
//     }
//   }
//
//   //----------------------------------------------------------------------------
//
//   ///* Subscribe to topic
//   static Future subscribeTopic(String topic) async {
//     try {
//       _firebaseMessaging.subscribeToTopic(topic);
//     } catch (e) {
//       printMeLog("SubscribeToTopicError: $e");
//     }
//   }
//
//   //----------------------------------------------------------------------------
//
//   static Future unsubscribeTopic(String topic) async {
//     try {
//       _firebaseMessaging.unsubscribeFromTopic(topic);
//     } catch (e) {
//       printMeLog("UnSubscribeFromTopicError: $e");
//     }
//   }
// }
//
//
