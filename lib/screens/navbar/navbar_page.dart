import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/buddy/buddy_bloc/buddy_bloc.dart';
import 'package:navigationapp/screens/home/home_page.dart';
import 'package:navigationapp/screens/navbar/bloc/navbar_bloc.dart';
import 'package:navigationapp/screens/settings/settings.dart';
import 'package:navigationapp/activity/activity_bloc/bloc.dart';
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
  NavBarBloc _navBarBloc = NavBarBloc();

  @override
  void initState() {
    super.initState();
    // _navBarBloc = BlocProvider.of<NavBarBloc>(context);
    // _navBarBloc.add(HomePageLoaded());
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
        BlocProvider<NavBarBloc>(
          create: (BuildContext context) => NavBarBloc(),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<NavBarBloc, NavBarState>(
          builder: (context, state) {
            if (state is PageLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is HomePageLoaded) {
              return HomePage();
            }
            if (state is TaskPageLoaded) {
              return TaskPage();
            }
            if (state is SettingsPageLoaded) {
              return SettingsPage();
            }
            return Container();
          },
        ),
        bottomNavigationBar: BlocBuilder<NavBarBloc, NavBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              onTap: (index) => _navBarBloc.add(PageTapped(index: index)),

              currentIndex: _navBarBloc.currentIndex,
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
            );
          },
        ),
      ),
    );
  }
}
