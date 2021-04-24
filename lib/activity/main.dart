import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/activity/activity_bloc/bloc.dart';
import 'package:navigationapp/theme.dart';

import 'activity_page.dart';

//NOTE this is a test entry point

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ActivityBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: ActivityPage(),
      ),
    );
  }
}
