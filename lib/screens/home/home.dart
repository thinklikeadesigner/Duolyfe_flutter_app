import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:navigationapp/screens/authenticate/gmailsignin/gmail_signin.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../app.dart';
import '../../main.dart';

class Home extends StatefulWidget {
  final String imagePath;
  Home({Key key, @required this.imagePath}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

/// This is the private State class that goes with Home.
class _HomeState extends State<Home> {
  String thisImage;
  int _selectedIndex = 0;
  void initState() {
    super.initState();
    thisImage = widget.imagePath;
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Image(image: AssetImage("giraffe.png"), height: 130),
    Text(
      'This is where the tasks feed will be',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    Text(
      'This is where the settings screen will be',
      style: TextStyle(fontWeight: FontWeight.bold),
      textAlign: TextAlign.end,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final GmailAuthService _authGmail = GmailAuthService();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
          child: Column(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          FlatButton(
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
                _auth.signOut();
                _authGmail.signOutGoogle();
                // Navigator.of(context).pushNamed('/signin');
              }),
          FlatButton(
              child: Text(
                'notify!',
                style: TextStyle(color: Colors.white),
              ),
              color: primaryTeal,
              splashColor: primaryTeal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () {
                print('notify pressed');
                // notify();
                scheduleAlarm();
                // Navigator.of(context).pushNamed('/signin');
              }),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

void scheduleAlarm() async {
  print('was called');
  var scheduledNotificationDateTime =
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 10));

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          icon: '@mipmap/ic_launcher');

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.zonedSchedule(0, 'plain title',
      'plain body', scheduledNotificationDateTime, platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime);
}
