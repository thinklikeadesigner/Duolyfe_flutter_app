// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:navigationapp/services/local_notifications.dart';

// class TestNotifyScreen extends StatefulWidget {
//   TestNotifyScreen({Key key}) : super(key: key);

//   @override
//   _TestNotifyScreenState createState() => _TestNotifyScreenState();
// }

// class _TestNotifyScreenState extends State<TestNotifyScreen> {
//   @override
//   void initState() {
//     super.initState();
//     localNotifyManager.setOnNotificationReceive(onNotificationReceive);
//     localNotifyManager.setOnNotificationClick(onNotificationClick);
//   }

//   onNotificationReceive(ReceiveNotification notification) {
//     print('Notification Received: $notification.id');
//   }

//   onNotificationClick(String payload) {
//     print('Payload: $payload');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Local Notifications'),
//       ),
//       body: Center(
//         child: FlatButton(
//             child: Text(
//               'notification!',
//               style: TextStyle(color: Colors.black),
//             ),
//             onPressed: () async {
//               await localNotifyManager.showNotification();
//               // Navigator.of(context).pushNamed('/signin');
//             }),
//       ),
//     );
//   }
// }
