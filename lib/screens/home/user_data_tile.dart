import 'package:flutter/material.dart';
import 'package:navigationapp/models/user_data.dart';

class UserDataTile extends StatelessWidget {
  final UserData userData;
  UserDataTile({this.userData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(radius: 25, backgroundColor: Colors.teal),
          title: Text('hi'),
          subtitle: Text('my name is'),
        ),
      ),
    );
  }
}
