import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/activity/activity_bloc/bloc.dart';
import 'package:navigationapp/buddy/buddy_bloc/buddy_bloc.dart';
import 'package:navigationapp/route_generator/route_generator.dart';
import 'package:navigationapp/screens/onboarding_screens/onboarding_screens.dart';
import 'package:navigationapp/theme.dart';

//NOTE this is a test entry point

void main() => runApp(MyApp());
RouteGenerator _routeGenerator = RouteGenerator();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: BuddyBloc()),
        BlocProvider.value(value: ActivityBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: ChooseInterests(),
        onGenerateRoute: _routeGenerator.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
