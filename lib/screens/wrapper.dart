import 'package:flutter/material.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/screens/authenticate/sign_in.dart';
// import 'package:navigationapp/screens/home/buddy.dart';
import 'package:navigationapp/screens/home/home.dart';
import 'package:navigationapp/screens/nav_screens/navbar.dart';
import 'package:navigationapp/screens/onboarding_screens/choose_work_time.dart';
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
              if (userData.completedOnboarding) {
                return NavBar();
              } else {
                return NavBar();
              }
            } else {
              return NavBar();
            }
          });
      // }
    }
  }
}
