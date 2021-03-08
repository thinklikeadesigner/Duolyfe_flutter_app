import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/services/interest_service.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';

import 'package:uic/widgets.dart';

import '../../app.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool interestFlag = false;
  var interests;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    InternetService()
        .getFirstInterest('Cooking')
        .then((QuerySnapshot snapshot) {
      if (snapshot.docs.isNotEmpty) {
        print(snapshot.docs);
      }
    });

    print(interests);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text('hi')],
        ),
      ),
    );
  }
}
