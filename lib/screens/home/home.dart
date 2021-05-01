import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../theme.dart';

//NOTE this is a test page
//NOTE this is the notification page fo
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

/// This is the private State class that goes with Home.
class _HomeState extends State<Home> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  InitializationSettings initializationSettings;

  int _selectedIndex = 0;

  void initState() {
    super.initState();
    initializing();
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
    await notification();
  }

  void _showNotificationsAfterSecond() async {
    await notificationAfterSec();
  }

//MAKEME decide the text for the notification.
  Future<void> notification() async {
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
      'Second Channel _ID',
      'Second Channel Title',
      'Second channel body',
      priority: Priority.high,
      importance: Importance.max,
      ticker: 'test',
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
    );

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(1, 'hello there too',
        'how are you as well?', timeDelayed, notificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  // tz.TZDateTime _convertTimeofDaytoDatetime(TimeOfDay timeOfDay) {
  //   TimeOfDay timeOfDay;
  //   final now = new tz.TZDateTime.now(tz.local);
  //   return new tz.TZDateTime(tz.local, now.year, now.month, now.day,
  //       timeOfDay.hour, timeOfDay.minute);
  // }

//MAKEME connect to timepicker
//IDEA use buddy store for time
  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 10, 30);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> _scheduleDailyTenAMNotification() async {
    print('pressed');
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'daily scheduled notification title',
        'daily scheduled notification body',
        _nextInstanceOfTenAM(),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      //MAKEME set the navigator to navigate a different screen
    }
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Image(image: AssetImage("hamster.png"), height: 130),
    Text(
      'This is where the tasks feed will be',
      style: optionStyle,
    ),
    Text(
      'This is where the settings screen will be',
      style: optionStyle,
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


    return Scaffold(
      body: Center(
          child: Column(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          //REFACTOR flatbutton to textbutton
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
                // _auth.signOut();
                // _authGmail.signOutGoogle();
                // Navigator.of(context).pushNamed('/signin');
              }),
          //REFACTOR flatbutton to textbutton
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
          //REFACTOR flatbutton to textbutton
          FlatButton(
              child: Text(
                'notiffy!',
                style: TextStyle(color: Colors.white),
              ),
              color: primaryTeal,
              splashColor: primaryTeal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () async {
                print('delayed notify pressed');
                _scheduleDailyTenAMNotification();

                // notify();

                // Navigator.of(context).pushNamed('/signin');
              }),
          //REFACTOR flatbutton to textbutton
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
                print('j');

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
