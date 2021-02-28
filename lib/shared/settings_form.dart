// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:navigationapp/models/user_class.dart';
// import 'package:navigationapp/models/user_interests.dart';
// import 'package:navigationapp/screens/home/home.dart';
// import 'package:navigationapp/services/database.dart';

// import 'package:provider/provider.dart';

// class SettingsForm extends StatefulWidget {
//   @override
//   _SettingsFormState createState() => _SettingsFormState();
// }

// class _SettingsFormState extends State<SettingsForm> {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserData>(context);

//     return StreamBuilder<UserInterests>(
//         stream: DatabaseService(uid: user.uid).userInterests,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             UserInterests userInterests = snapshot.data;
//             print(userInterests);
//             // print('hi');
//             return Container();
//           }
//         });
//   }
// }
