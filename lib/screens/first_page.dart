import 'package:flutter/material.dart';
import 'package:navigationapp/app.dart';
import 'package:preview/preview.dart';

import '../app.dart';

class FirstPage extends StatelessWidget with Previewer {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'First Page',
                style: TextStyle(fontSize: 50),
              ),
              RaisedButton(
                child: Text('Go to first'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
              ),
              RaisedButton(
                child: Text('Start onboarding'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/onboardingstart');
                },
              ),
              RaisedButton(
                child: Text('Choose Buddy'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/choosebuddy');
                },
              ),
              RaisedButton(
                child: Text('Choose name'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/choosename');
                },
              ),
              RaisedButton(
                child: Text('Pick Milo'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/milonamepicked');
                },
              ),
              RaisedButton(
                child: Text('Pick Sky'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/skynamepicked');
                },
              ),
              RaisedButton(
                  child: Text('pick your lunch time'),
                  splashColor: primaryTeal,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/picklunchtime');
                  }),
              // OutlineButton(
              //   child: Text('Start Onboarding'),
              //   onPressed: () {
              //     Navigator.of(context).pushNamed('/onboardingstart');
              //   },
              // ),
              RaisedButton(
                child: Text('Choose activity'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/chooseactivity');
                },
              ),
              RaisedButton(
                child: Text('Pick work time'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/pickworktime');
                },
              ),
              // RaisedButton(
              //   child: Text('Pick lunch time'),
              //   onPressed: () {
              //     Navigator.of(context).pushNamed('/picklunchtime');
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
