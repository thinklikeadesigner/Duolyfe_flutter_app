import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/buddy/buddy_bloc/bloc.dart';
import 'package:navigationapp/theme.dart';
import 'buddy_page.dart';

//NOTE this is a test page
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BuddyBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: BuddyPage(),
      ),
    );
  }
}
