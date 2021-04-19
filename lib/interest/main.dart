import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/interest/bloc/interest_bloc.dart';
import 'package:navigationapp/interest/interest_page.dart';

import '../theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrapping the whole app with BlocProvider to get access to BuddyBloc everywhere
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
