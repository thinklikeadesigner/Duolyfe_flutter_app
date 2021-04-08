import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:navigationapp/InterestData/onetimeread.dart';
import '../app.dart';

class ExampleFetch extends StatefulWidget {
  @override
  _ExampleFetchState createState() => _ExampleFetchState();
}

class _ExampleFetchState extends State<ExampleFetch> {
  dynamic data;
  List documents;

  fetchData() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Interests');
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        documents = snapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    child: Text(
                      'fetch data',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: primaryTeal,
                    splashColor: primaryTeal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    height: 100.0,
                    minWidth: 200.0,
                    onPressed: () {
                      // fetchData();
                    },
                  ),
                  Text(
                    'j',
                    // documents.toString(),
                  ),
                  OneTimeRead(),
                ],
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
