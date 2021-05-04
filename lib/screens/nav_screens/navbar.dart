import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/activity/activity_page.dart';
import 'package:navigationapp/buddy/buddy_bloc/buddy_bloc.dart';
import 'package:navigationapp/buddy/buddy_page.dart';
import 'package:navigationapp/screens/home/home_page.dart';
import 'package:navigationapp/screens/onboarding_screens/onboarding_screens.dart';
import 'package:navigationapp/screens/settings/settings.dart';
import 'package:navigationapp/activity/activity_bloc/bloc.dart';
import 'package:navigationapp/tasks/task_bloc/bloc.dart';
import 'package:navigationapp/tasks/task_page.dart';
//REFACTOR I would like navbar to be refactored into BloC. it's in feature/navbar branch
class NavBar extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => NavBar());
  }

  @override
  State<StatefulWidget> createState() {
    return _NavBarState();
  }
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomePage(), TaskPage(), SettingsPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BuddyBloc>(
          create: (BuildContext context) => BuddyBloc(),
        ),
        BlocProvider<TaskBloc>(
          create: (BuildContext context) => TaskBloc(),
        ),
        BlocProvider<ActivityBloc>(
          create: (BuildContext context) => ActivityBloc(),
        ),
      ],
      child: Scaffold(
        body: _children[_currentIndex], // new
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black, // new
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              label: 'Buddy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Self-Care',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
