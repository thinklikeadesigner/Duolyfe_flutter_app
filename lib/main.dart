import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Firebase.initializeApp();

  runApp(App());
}

//https://www.youtube.com/watch?v=p5dkB3Mrxdo stateful widgets
//https://www.youtube.com/watch?v=d5PpeNb-dOY passing data between screens
