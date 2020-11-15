import 'package:flutter/material.dart';
import 'package:navigationapp/route_generator/route_generator.dart';
import 'package:preview/preview.dart';
import 'screens/first_page.dart';

const primaryTeal = const Color((0xff30D4D4));
const purpleMessage = const Color(0xff79227B);

class App extends StatelessWidget with Previewer {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: FirstPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

// 30D4D4
