import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/screens/home/home_page.dart';
import 'package:navigationapp/screens/onboarding_screens/choose_activity.dart';
import 'package:navigationapp/screens/onboarding_screens/choose_buddy.dart';
import 'package:navigationapp/screens/onboarding_screens/milo_name_picked.dart';
import 'package:navigationapp/screens/onboarding_screens/onboarding_start.dart';
import 'package:navigationapp/screens/onboarding_screens/sky_name_picked.dart';
import 'package:navigationapp/screens/settings/settings.dart';
import 'package:navigationapp/tasks/task_bloc/bloc.dart';
import 'package:navigationapp/tasks/task_page.dart';

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
  final List<Widget> _children = [
    HomePage(),
    OnboardingStart(),
    SettingsPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskBloc(),
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

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
