// import 'dart:isolate';

// import 'package:android_alarm_manager/android_alarm_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:navigationapp/screens/onboarding_screens/onboarding_start.dart';
// import 'app.dart';

// /// The [SharedPreferences] key to access the alarm fire count.
// const String countKey = 'count';

// /// The name associated with the UI isolate's [SendPort].
// const String isolateName = 'isolate';

// /// A port used to communicate from a background isolate to the UI isolate.
// final ReceivePort port = ReceivePort();

// /// Global [SharedPreferences] object.
// SharedPreferences prefs;

// void printHello() {
//   final DateTime now = DateTime.now();
//   final int isolateId = Isolate.current.hashCode;
//   print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
// }

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     new FlutterLocalNotificationsPlugin();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // var initializationSettingsAndroid =
//   //     AndroidInitializationSettings('codex_logo');
//   // var initializationSettingsIOS = IOSInitializationSettings(
//   //     requestAlertPermission: true,
//   //     requestBadgePermission: true,
//   //     requestSoundPermission: true,
//   //     onDidReceiveLocalNotification:
//   //         (int id, String title, String body, String payload) async {});
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('ic_launcher');

//   final InitializationSettings initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);

//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: (String payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: ' + payload);
//     }
//   });

//   void scheduleAlarm() async {

// var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 10));

//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'alarm_notif',
//       'alarm_notif',
//       'Channel for Alarm notification',
//       icon: 'ic_launcher',
//       sound: null,
//       largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
//     );

//     var iOSPlatformChannelSpecifics = IOSNotificationDetails(
//         sound: 'a_long_cold_sting.wav',
//         presentAlert: true,
//         presentBadge: true,
//         presentSound: true);
//     var platformChannelSpecifics = NotificationDetails(
//         androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.schedule(0, 'Office', alarmInfo.title,
//         scheduledNotificationDateTime, platformChannelSpecifics);
//   }

//   void onSaveAlarm() {
//     DateTime scheduleAlarmDateTime;
//     if (_alarmTime.isAfter(DateTime.now()))
//       scheduleAlarmDateTime = _alarmTime;
//     else
//       scheduleAlarmDateTime = _alarmTime.add(Duration(days: 1));

//     var alarmInfo = AlarmInfo(
//       alarmDateTime: scheduleAlarmDateTime,
//       gradientColorIndex: _currentAlarms.length,
//       title: 'alarm',
//     );
//     _alarmHelper.insertAlarm(alarmInfo);
//     scheduleAlarm(scheduleAlarmDateTime, alarmInfo);
//     Navigator.pop(context);
//     loadAlarms();
//   }

//   void deleteAlarm(int id) {
//     _alarmHelper.delete(id);
//     //unsubscribe for notification
//     loadAlarms();
//   }
// }

//   // final int helloAlarmID = 0;
//   // await AndroidAlarmManager.initialize();
//   // await AndroidAlarmManager.periodic(
//   //     const Duration(minutes: 1), helloAlarmID, printHello);

//   await Firebase.initializeApp();

//   runApp(App());
// }

// import 'dart:isolate';

// import 'package:android_alarm_manager/android_alarm_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:navigationapp/screens/onboarding_screens/onboarding_start.dart';
// import 'app.dart';

// // /// The [SharedPreferences] key to access the alarm fire count.
// // const String countKey = 'count';

// // /// The name associated with the UI isolate's [SendPort].
// // const String isolateName = 'isolate';

// // /// A port used to communicate from a background isolate to the UI isolate.
// // final ReceivePort port = ReceivePort();

// // /// Global [SharedPreferences] object.
// // SharedPreferences prefs;

// // void printHello() {
// //   final DateTime now = DateTime.now();
// //   final int isolateId = Isolate.current.hashCode;
// //   print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
// // }

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     new FlutterLocalNotificationsPlugin();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('ic_launcher');

//   final InitializationSettings initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);

//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: (String payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: ' + payload);
//     }
//   });

//   void scheduleAlarm() async {

// var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 10));

//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'alarm_notif',
//       'alarm_notif',
//       'Channel for Alarm notification',
//       icon: 'ic_launcher',
//       sound: null,
//       largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
//     );

//     var iOSPlatformChannelSpecifics = IOSNotificationDetails(
//         sound: 'a_long_cold_sting.wav',
//         presentAlert: true,
//         presentBadge: true,
//         presentSound: true);
//     var platformChannelSpecifics = NotificationDetails(
//         androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.schedule(0, 'Office', alarmInfo.title,
//         scheduledNotificationDateTime, platformChannelSpecifics);
//   }

// }

//   await Firebase.initializeApp();

//   runApp(App());
// }
