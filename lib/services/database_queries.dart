import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navigationapp/app.dart';
import 'dart:core';

class DummyDataTry extends StatefulWidget {
  DummyDataTry({Key key}) : super(key: key);

  @override
  _DummyDataTryState createState() => _DummyDataTryState();
}

class _DummyDataTryState extends State<DummyDataTry> {
  Map data;

  add() {
    Map<String, dynamic> demodata = {
      "first_name": "Evin",
      "last_name": "Hubbocks",
      "accumulated_points": 94,
      "off_work": "4:58 PM",
      "selected_buddy": {"panda": false, "sheep": true, "fox": false},
      "selected_activities": {
        "hiking": false,
        "reading": false,
        "cooking": true,
        "dancing": false,
        "gardening": false,
        "meditating": true
      }
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');

    collectionReference.add(demodata);
  }

  fetchdata() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        snapshot.docs[0].data();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Text(data.toString()),
      ),
      RaisedButton(
          child: Text('add'), splashColor: primaryTeal, onPressed: add),
    ]);
  }
}

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return Text('error');
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return App();
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return Text('loading');
//       },
//     );
//   }
// }
