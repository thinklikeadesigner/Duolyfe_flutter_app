import 'package:flutter/material.dart';
import 'package:navigationapp/models/config.dart';

class ConfigTile extends StatelessWidget {
  final Config config;
  ConfigTile({this.config});

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
