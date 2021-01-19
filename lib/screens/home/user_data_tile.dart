import 'package:flutter/material.dart';
import 'package:navigationapp/models/onboarding_data.dart';

class OnboardingTile extends StatelessWidget {
  final Onboarding onboarding;
  OnboardingTile({this.onboarding});

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
