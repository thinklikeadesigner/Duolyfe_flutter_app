// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:navigationapp/models/user_class.dart';
// import 'package:navigationapp/models/user_data.dart';
// import 'package:navigationapp/services/database.dart';
// import 'package:navigationapp/shared/constants.dart';
// import 'package:navigationapp/shared/loading.dart';
// import 'package:provider/provider.dart';

// class SettingsForm extends StatefulWidget {
//   @override
//   _SettingsFormState createState() => _SettingsFormState();
// }

// class _SettingsFormState extends State<SettingsForm> {
//   final _formKey = GlobalKey<FormState>();
//   final List<String> buddy = ['panda', 'wolf', 'cat', 'dog', 'elephant'];

//   //form values
//   dynamic _currentInterests;
//   int _currentTime;
//   String _currentBuddy;

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserClass>(context);

//     return StreamBuilder<UserData>(
//         stream: DatabaseService(uid: user.uid).userData,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             UserData userData = snapshot.data;
//             return Form(
//               key: _formKey,
//               child: Column(
//                 children: <Widget>[
//                   Text('Update your brew settings',
//                       style: TextStyle(fontSize: 18.0)),
//                   SizedBox(height: 20.0),
//                   // TextFormField(
//                   //   initialValue: userData.buddy,
//                   //   decoration: TextInputDecoration,
//                   //   validator: (val) =>
//                   //       val.isEmpty ? 'Please enter a name' : null,
//                   //   onChanged: ((val) => setState(() => _currentName = val)),
//                   // ),
//                   SizedBox(height: 20.0),
//                   //dropdown
//                   DropdownButtonFormField(
//                     decoration: TextInputDecoration,
//                     value: _currentBuddy ?? userData.buddy,
//                     items: buddy.map((buddy) {
//                       return DropdownMenuItem(
//                         value: buddy,
//                         child: Text('$buddy'),
//                       );
//                     }).toList(),
//                     onChanged: ((val) => setState(() => _currentBuddy = val)),
//                   ),
//                   //slider
//                   // Slider(
//                   //   value: (_currentStrength ?? userData.strength).toDouble(),
//                   //   activeColor:
//                   //       Colors.brown[_currentStrength ?? userData.strength],
//                   //   inactiveColor:
//                   //       Colors.brown[_currentStrength ?? userData.strength],
//                   //   min: 100,
//                   //   max: 900,
//                   //   divisions: 8,
//                   //   onChanged: ((val) =>
//                   //       setState(() => _currentStrength = val.round())),
//                   // ),
//                   // button
//                   RaisedButton(
//                       color: Colors.pink[400],
//                       child: Text(
//                         'Update',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       onPressed: () async {
//                         if (_formKey.currentState.validate()) {
//                           await DatabaseService(uid: user.uid).updateOnboarding(
//                               _currentInterests ?? userData.interests,
//                               _currentTime ?? userData.time,
//                               _currentBuddy ?? userData.buddy);
//                           Navigator.pop(context);
//                         }
//                       }),
//                 ],
//               ),
//             );
//           } else {
//             return Loading();
//           }
//         });
//   }
// }
