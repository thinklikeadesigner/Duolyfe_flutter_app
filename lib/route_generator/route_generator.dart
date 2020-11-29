import 'package:flutter/material.dart';
import 'package:navigationapp/screens/authenticate/authenticate.dart';
import 'package:navigationapp/screens/home/home.dart';
import 'package:navigationapp/screens/onboarding_screens/choose_name.dart';
import 'package:navigationapp/screens/error_route_page.dart';
import 'package:navigationapp/screens/onboarding_screens/choose_lunch_time.dart';
import 'package:navigationapp/screens/onboarding_screens/choose_work_time.dart';
import 'package:navigationapp/screens/onboarding_screens/choose_activity.dart';
import 'package:navigationapp/screens/onboarding_screens/milo_name_picked.dart';
import 'package:navigationapp/screens/onboarding_screens/onboarding_start.dart';
import 'package:navigationapp/screens/onboarding_screens/sky_name_picked.dart';
import 'package:navigationapp/screens/onboarding_screens/choose_buddy.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    //settings.arguments is if you need to send data to a page
    //https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments
    //https://flutter.dev/docs/cookbook/navigation/returning-data
    //https://flutter.dev/docs/cookbook/navigation/passing-data

    switch (settings.name) {
      case '/onboardingstart':
        return MaterialPageRoute(builder: (_) => OnboardingStart());
      case '/choosebuddy':
        return MaterialPageRoute(builder: (_) => ChooseBuddy());
      case '/choosename':
        return MaterialPageRoute(builder: (_) => ChooseName());
      case '/milonamepicked':
        return MaterialPageRoute(builder: (_) => MiloNamePicked());
      case '/skynamepicked':
        return MaterialPageRoute(builder: (_) => SkyNamePicked());
      case '/chooseactivity':
        return MaterialPageRoute(builder: (_) => ChooseActivity());
      case '/chooseworktime':
        return MaterialPageRoute(builder: (_) => ChooseWorkTime());
      case '/picklunchtime':
        return MaterialPageRoute(builder: (_) => ChooseLunchTime());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/':
        return MaterialPageRoute(builder: (_) => Authenticate());
      default:
        return MaterialPageRoute(builder: (_) => ErrorRoutePage());
    }
  }
}
