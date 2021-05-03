import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/activity/activity_bloc/bloc.dart';
import 'package:navigationapp/activity/activity_page.dart';
import 'package:navigationapp/buddy/buddy_bloc/buddy_bloc.dart';
import 'package:navigationapp/buddy/buddy_page.dart';
import 'package:navigationapp/screens/home/home_page.dart';
import 'package:navigationapp/screens/navbar/navbar_page.dart';
import 'package:navigationapp/splash/splash.dart';
import 'package:navigationapp/tasks/task_bloc/bloc.dart';
import 'package:navigationapp/tasks/task_page.dart';
import 'error_route_page.dart';
import '../screens/onboarding_screens/choose_interests.dart';
import '../screens/onboarding_screens/choose_buddy.dart';
import '../screens/onboarding_screens/choose_name.dart';
import '../screens/onboarding_screens/choose_work_time.dart';
import '../screens/onboarding_screens/milo_name_picked.dart';
import '../screens/onboarding_screens/onboarding_start.dart';
import '../screens/onboarding_screens/sky_name_picked.dart';

class RouteGenerator {
  final BuddyBloc _buddyBloc = BuddyBloc();
  final TaskBloc _taskBloc = TaskBloc();
  final ActivityBloc _activityBloc = ActivityBloc();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/onboardingstart':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _buddyBloc, child: OnboardingStart()));
      case '/choosebuddy':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: _buddyBloc, child: ChooseBuddy()));
      case '/choosename':
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider.value(value: _buddyBloc, child: ChooseName()));
      case '/milonamepicked':
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider.value(value: _buddyBloc, child: MiloNamePicked()));
      case '/skynamepicked':
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider.value(value: _buddyBloc, child: SkyNamePicked()));
      case '/chooseactivity':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _buddyBloc),
              BlocProvider.value(value: _taskBloc),
              BlocProvider.value(value: _activityBloc),
            ],
            child: ChooseInterests(),
          ),
        );
      case '/taskpage':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _buddyBloc),
              BlocProvider.value(value: _taskBloc),
              BlocProvider.value(value: _activityBloc),
            ],
            child: TaskPage(),
          ),
        );
      case '/chooseworktime':
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider.value(value: _buddyBloc, child: ChooseWorkTime()),
        );
      case '/buddy':
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider.value(value: _buddyBloc, child: BuddyPage()),
        );
      case '/activitypage':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _buddyBloc),
              BlocProvider.value(value: _taskBloc),
              BlocProvider.value(value: _activityBloc),
            ],
            child: ActivityPage(),
          ),
        );

      case '/homepage':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _buddyBloc),
              BlocProvider.value(value: _taskBloc),
              BlocProvider.value(value: _activityBloc),
            ],
            child: HomePage(),
          ),
        );
      case '/navbar':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _buddyBloc),
              BlocProvider.value(value: _taskBloc),
              BlocProvider.value(value: _activityBloc),
            ],
            child: NavBar(),
          ),
        );

      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: _buddyBloc, child: SplashPage()));
      default:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: _buddyBloc, child: ErrorRoutePage()));
    }
  }

  void dispose() {
    _buddyBloc.close();
    _taskBloc.close();
    _activityBloc.close();
  }
}
