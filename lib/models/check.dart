import 'package:flutter/material.dart';
import 'package:navigationapp/app.dart';

class CheckTile extends StatefulWidget {
  @override
  _CheckTileState createState() => _CheckTileState();
}

class _CheckTileState extends State<CheckTile> {
  String activity;

  var _checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CheckboxListTile(
          secondary: Text('swimming'),
          controlAffinity: ListTileControlAffinity.platform,
          value: _checked,
          onChanged: (bool value) {
            setState(() {
              _checked = value;
            });
          },
          activeColor: primaryTeal,
          checkColor: Colors.white),
    );
  }
}
