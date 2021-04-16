import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/interest/interest_bloc/bloc.dart';
import 'package:navigationapp/screens/nav_screens/navbar.dart';
// import 'package:navigationapp/Interests/interest_bloc/bloc.dart';
import 'package:navigationapp/theme.dart';

import '../interest_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrapping the whole app with BlocProvider to get access to InterestBloc everywhere
    // BlocProvider extends InheritedWidget.
    //  @override

    return BlocProvider(
      create: (_) => InterestBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: InterestPage(),
      ),
    );
  }
}
