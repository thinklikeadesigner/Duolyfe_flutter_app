import 'package:flutter/material.dart';
import 'package:navigationapp/models/user_class.dart';

import 'package:navigationapp/screens/authenticate/sign_in.dart';
import 'package:navigationapp/screens/home/health.dart';
import 'package:navigationapp/screens/onboarding_screens/onboarding_start.dart';
import 'package:navigationapp/screens/onboarding_screens/test_screen.dart';
import 'package:navigationapp/services/TestNotifyScreen.dart';
import 'package:navigationapp/services/database.dart';
import 'package:navigationapp/shared/loading.dart';
import 'package:navigationapp/shared/settings_form.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context);

    if (user == null) {
      return SignIn();
    } else {
      // print(user.uid);

      return StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserData userData = snapshot.data;
              // print(userData);
              if (userData.completedOnboarding) {
                // print(userData.completedOnboarding);
                // print('onboarding');
                // return Home(
                //   imagePath: null,
                // );
                return Home(imagePath: null);
              } else {
                // print('no onboarding');
                return OnboardingStart();
              }
            } else {
              print('where is data');
              return Loading();
            }
          });
      // }
    }
  }
}

//TODO it seems, it only switches to sign up screen when logout is pressed on the same page that is returned on wrapper when user isn't null
