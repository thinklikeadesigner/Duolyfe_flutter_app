import 'package:flutter/material.dart';

//IDEA add darkmode theme

const primaryTeal = const Color((0xff30D4D4));
const purpleMessage = const Color(0xff79227B);

final theme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  primaryColor: primaryTeal,
  accentColor: Colors.cyan[600],
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);
