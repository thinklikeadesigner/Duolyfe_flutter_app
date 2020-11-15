import 'package:flutter/material.dart';

import '../app.dart';

class OnboardingSkipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text('Skip'),
        splashColor: primaryTeal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black)),
        onPressed: () {
          Navigator.of(context).pushNamed('/choosename');
        });
  }
}

class OnboardingLetsDoItButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(
          'Let\'s do it!',
          style: TextStyle(color: Colors.white),
        ),
        color: primaryTeal,
        splashColor: primaryTeal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/choosebuddy');
        });
  }
}

class SkipActivitiesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text('Skip'),
        splashColor: primaryTeal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black)),
        onPressed: () {
          Navigator.of(context).pushNamed('/third');
        });
  }
}

class SkipActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text('Skip and surprise me'),
        splashColor: primaryTeal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black)),
        onPressed: () {
          Navigator.of(context).pushNamed('/pickworktime');
        });
  }
}

class SkipChooseName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text('Skip'),
        splashColor: primaryTeal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black)),
        onPressed: () {
          Navigator.of(context).pushNamed('/milonamepicked');
        });
  }
}

class MiloNameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(
          'Milo!',
          style: TextStyle(color: Colors.white),
        ),
        color: primaryTeal,
        splashColor: primaryTeal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/milonamepicked');
        });
  }
}

class SkyNameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(
          'Sky!',
          style: TextStyle(color: Colors.white),
        ),
        color: primaryTeal,
        splashColor: primaryTeal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/skynamepicked');
        });
  }
}

class PickActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(
          'Let\s do it!',
          style: TextStyle(color: Colors.white),
        ),
        color: primaryTeal,
        splashColor: primaryTeal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/chooseactivity');
        });
  }
}

class PickBuddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(
          'Let\s do it!',
          style: TextStyle(color: Colors.white),
        ),
        color: primaryTeal,
        splashColor: primaryTeal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/choosename');
        });
  }
}
