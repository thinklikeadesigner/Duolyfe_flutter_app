import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/buddy/buddy_bloc/buddy_bloc.dart';
import 'package:navigationapp/buddy/buddy_page.dart';
import 'package:navigationapp/screens/home/home_page.dart';
import 'package:navigationapp/screens/nav_screens/navbar.dart';
import 'package:navigationapp/splash/splash.dart';
import 'package:navigationapp/tasks/task_bloc/bloc.dart';
import 'error_route_page.dart';
import '../screens/onboarding_screens/choose_activity.dart';
import '../screens/onboarding_screens/choose_buddy.dart';
import '../screens/onboarding_screens/choose_name.dart';
import '../screens/onboarding_screens/choose_work_time.dart';
import '../screens/onboarding_screens/milo_name_picked.dart';
import '../screens/onboarding_screens/onboarding_start.dart';
import '../screens/onboarding_screens/sky_name_picked.dart';

class RouteGenerator {
  final BuddyBloc _buddyBloc = BuddyBloc();
  final TaskBloc _taskBloc = TaskBloc();
  //TODO SHOW AND TELL
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    //settings.arguments is if you need to send data to a page
    //https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments
    //https://flutter.dev/docs/cookbook/navigation/returning-data
    //https://flutter.dev/docs/cookbook/navigation/passing-data

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
                  ],
                  child: ChooseActivity(),
                ));
      case '/chooseworktime':
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider.value(value: _buddyBloc, child: ChooseWorkTime()));
      case '/buddy':
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider.value(value: _buddyBloc, child: BuddyPage()));

      case '/homepage':
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider.value(value: _buddyBloc, child: HomePage()));
      case '/navbar':
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider.value(value: _buddyBloc, child: NavBar()));

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
  }
}
