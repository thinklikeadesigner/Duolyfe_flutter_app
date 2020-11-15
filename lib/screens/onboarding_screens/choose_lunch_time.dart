import 'package:flutter/material.dart';
import 'package:preview/preview.dart';

class ChooseLunchTime extends StatelessWidget with Previewer {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'pick lunch time',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
