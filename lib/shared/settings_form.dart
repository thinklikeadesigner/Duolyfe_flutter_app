import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/screens/home/home.dart';
import 'package:navigationapp/services/database.dart';

import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            print(userData.completedOnboarding);
            print('hi');
            return Container();
          }
        });
  }
}
