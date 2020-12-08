import 'package:flutter/material.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/screens/authenticate/authenticate.dart';
import 'package:navigationapp/screens/onboarding_screens/onboarding_start.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

// class Wrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserClass>(context);
//     print(user);

//     //return either home or authenticate widget

//     if (user == null) {
//       print('signed out');
//       return Authenticate();
//     } else {
//       return OnboardingStart();
//     }
//   }
// }

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context);
    print(user);

    //return either home or authenticate widget

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

//TODO it seems, it only switches to sign up screen when logout is pressed on the same page that is returned on wrapper when user isn't null
