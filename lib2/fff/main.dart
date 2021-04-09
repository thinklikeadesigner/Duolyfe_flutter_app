import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/screens/nav_screens/navbar.dart';
import 'package:navigationapp/theme.dart';

import 'fruit_bloc/bloc.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrapping the whole app with BlocProvider to get access to FruitBloc everywhere
    // BlocProvider extends InheritedWidget.
    //  @override

    return BlocProvider(
      create: (_) => FruitBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: HomePage(),
      ),
    );
  }
}
