import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/login/login.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/route_generator/route_generator.dart';
import 'package:navigationapp/screens/authenticate/sign_in.dart';
import 'package:navigationapp/screens/home/buddy.dart';
import 'package:navigationapp/screens/wrapper.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:navigationapp/theme.dart';
import 'package:provider/provider.dart';

import 'authentication/authentication.dart';

class App extends StatelessWidget {
  const App({
    Key key,
    @required this.authenticationRepository,
  })  : assert(authenticationRepository != null),
        super(key: key);
  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

//TODO change stream provider to block provider
    // return StreamProvider<UserClass>.value(
    //   value: AuthService().user,
    //   child: MaterialApp(
    //     title: 'Navigation Demo',
    //     theme: theme,
    //     home: Buddy(),
    //     onGenerateRoute: RouteGenerator.generateRoute,
    //   ),
    // );
//   }
// }

    // @override
    // Widget build(BuildContext context) {
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.portraitUp,
    //     DeviceOrientation.portraitDown,
    //   ]);
    return MaterialApp(
      theme: theme,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  Buddy.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
// }

// return StreamProvider<UserClass>.value(
//   value: AuthService().user,
//   child: MaterialApp(
//     title: 'Navigation Demo',
//     theme: ThemeData(
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       brightness: Brightness.light,
//       primaryColor: primaryTeal,
//       accentColor: Colors.cyan[600],
//       fontFamily: 'Georgia',
//       textTheme: TextTheme(
//         headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//         headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
//         bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//       ),
//     ),
//     home: Wrapper(),
