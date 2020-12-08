import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:navigationapp/models/user_data.dart';
import 'package:navigationapp/screens/home/user_data_list.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:navigationapp/services/database.dart';
import 'package:navigationapp/shared/settings_form.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: Text('Bottom sheet')
                // SettingsForm()
                );
          });
    }

    return StreamProvider<List<UserOnboardingData>>.value(
      value: DatabaseService().userOnboardingData,
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
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: UserOnboardingDataList(),
      ),
    );
  }
}
