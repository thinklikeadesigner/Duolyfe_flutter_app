// import 'dart:isolate';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:navigationapp/screens/onboarding_screens/onboarding_start.dart';
import 'app.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    new FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  AndroidInitializationSettings initializationSettingsAndroid =
      new AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  });

  // final int helloAlarmID = 0;
  // await AndroidAlarmManager.initialize();
  // await AndroidAlarmManager.periodic(
  //     const Duration(minutes: 1), helloAlarmID, printHello);

  await Firebase.initializeApp();

  runApp(App());
}

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
