import 'package:flutter/material.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/screens/authenticate/sign_in.dart';
import 'package:navigationapp/screens/home/buddy.dart';
import 'package:navigationapp/screens/onboarding_screens/onboarding_start.dart';
import 'package:navigationapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:uic/login_uic.dart';

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
      return StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserData userData = snapshot.data;

              // userData.interests.forEach((element) {
              //   print(element);
              // });

              if (userData.completedOnboarding) {
                // print(userData.completedOnboarding);
                // print('onboarding');
                // return Home(
                //   imagePath: null,
                // );
                return OnboardingStart();
              } else {
                return Buddy();
              }
            } else {
              DatabaseService(uid: user.uid)
                  .updateOnboarding(['Crafts', 'Social'], false, 'panda');
              Navigator.of(context).pushNamed('/choosebuddy');
              return OnboardingStart();
            }
          });
      // }
    }
  }
}
