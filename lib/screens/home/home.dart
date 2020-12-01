import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:navigationapp/models/config.dart';
import 'package:navigationapp/screens/home/config_list.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:navigationapp/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Config>>.value(
      value: DatabaseService().configs,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                print('signing out');
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: ConfigList(),
      ),
    );
  }
}
