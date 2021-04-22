import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:navigationapp/services/files/read_tasks_file.dart';
import 'app.dart';
import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;

  runApp(App(authenticationRepository: AuthenticationRepository()));
}
