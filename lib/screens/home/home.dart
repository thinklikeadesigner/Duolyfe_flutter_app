import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:navigationapp/screens/authenticate/gmailsignin/gmail_signin.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:navigationapp/services/listview.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../app.dart';

class Home extends StatefulWidget {
  final String imagePath;
  Home({Key key, @required this.imagePath}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

/// This is the private State class that goes with Home.
class _HomeState extends State<Home> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  InitializationSettings initializationSettings;

  String thisImage;
  int _selectedIndex = 0;

  void initState() {
    super.initState();
    initializing();
    thisImage = widget.imagePath;
  }

  void initializing() async {
    androidInitializationSettings =
        AndroidInitializationSettings('ic_launcher');
    initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void _showNotifications() async {
    // print('run run');
    await notification();
  }

  void _showNotificationsAfterSecond() async {
    // print('run run again');
    await notificationAfterSec();
  }

  Future<void> notification() async {
    // print('run');
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'Channel _ID', 'Channel Title', 'channel body',
            priority: Priority.high,
            importance: Importance.max,
            ticker: 'test',
            largeIcon: DrawableResourceAndroidBitmap('ic_launcher'));
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, 'hello there', 'how are you?', notificationDetails);
  }

  Future<void> notificationAfterSec() async {
    print('wont display');
    var timeDelayed =
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));
    // print('run');
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'Second Channel _ID', 'Second Channel Title', 'Second channel body',
      priority: Priority.high,
      importance: Importance.max,
      ticker: 'test',
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
      // icon: '',
      // largeIcon: DrawableResourceAndroidBitmap('ic_launcher')
      // playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification_sound')
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(1, 'hello there too',
        'how are you as well?', timeDelayed, notificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      // print(payLoad);
    }

//we can set the navigator to navigate a different screen
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
              onPressed: () async {
                print('immediat notify pressed');
                _showNotifications();

                // notify();

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
              onPressed: () async {
                print('delayed notify pressed');
                _showNotificationsAfterSecond();

                // notify();

                // Navigator.of(context).pushNamed('/signin');
              }),
          FlatButton(
              child: Text(
                'cooking!',
                style: TextStyle(color: Colors.white),
              ),
              color: primaryTeal,
              splashColor: primaryTeal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () async {
                Cooking();

                // notify();

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
