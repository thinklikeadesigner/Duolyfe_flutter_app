// import 'package:meta/meta.dart';

// class Task {
//   // Id will be gotten from the database.
//   // It's automatically generated & unique for every stored Activity.
//   int id;

//   final String activity;
//   String interest;
//   String timeAssigned;
//   final int icon;
//   bool completed;

//   Task(
//       {@required this.activity,
//       @required this.icon,
//       @required this.interest,
//       @required this.completed,
//       @required this.timeAssigned});

//   Map<String, dynamic> toMap() {
//     return {
//       'activity': activity,
//       'interest': interest,
//       'icon': icon,
//       'completed': completed,
//       'timeAssigned': timeAssigned
//     };
//   }

//   static Task fromMap(Map<String, dynamic> map) {
//     return Task(
//       activity: map['activity'],
//       interest: map['interest'],
//       icon: map['icon'],
//       completed: map['completed'],
//       timeAssigned: map['timeAssigned'],
//     );
//   }
// }
