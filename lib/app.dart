import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/route_generator/route_generator.dart';
import 'package:navigationapp/screens/wrapper.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:provider/provider.dart';

const primaryTeal = const Color((0xff30D4D4));
const purpleMessage = const Color(0xff79227B);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StreamProvider<UserClass>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Navigation Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: primaryTeal,
          accentColor: Colors.cyan[600],
          fontFamily: 'Georgia',
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
