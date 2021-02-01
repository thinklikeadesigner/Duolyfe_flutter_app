import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

// /// The [SharedPreferences] key to access the alarm fire count.
// const String countKey = 'count';

// /// The name associated with the UI isolate's [SendPort].
// const String isolateName = 'isolate';

// /// A port used to communicate from a background isolate to the UI isolate.
// final ReceivePort port = ReceivePort();

// /// Global [SharedPreferences] object.
// SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // IsolateNameServer.registerPortWithName(
  //   port.sendPort,
  //   isolateName,
  // );

  // prefs = await SharedPreferences.getInstance();

  // if (!prefs.containsKey(countKey)) {
  //   await prefs.setInt(countKey, 0);
  // }

  await Firebase.initializeApp();

  runApp(App());
}
