import 'package:flutter/material.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/route_generator/route_generator.dart';
import 'package:navigationapp/screens/wrapper.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:provider/provider.dart';

const primaryTeal = const Color((0xff30D4D4));
const purpleMessage = const Color(0xff79227B);
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class App extends StatelessWidget {
  // var initializationSettingsAndroid =
  //     AndroidInitializationSettings('duolyfe_icon');

  // var initializationSettings = InitializationSettings();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserClass>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Navigation Demo',
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: primaryTeal,
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: Wrapper(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

//TODO fix so don't have to hot restart after logout
