import 'package:meta/meta.dart';

class Activity {
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Activity.
  int id;
/*
TODO some how, if each activity has an interest and an icon,
then i don't need to have a nested list
so i can just use the button for selecting the interest to
filter all the activities that contain that interest, 
and add it to the suggestions store

*/

  final String activity;
  String interest;
  String timeAssigned;
  final int icon;
  bool completed;

  Activity(
      {@required this.activity,
      @required this.icon,
      @required this.interest,
      @required this.completed,
      @required this.timeAssigned});

  Map<String, dynamic> toMap() {
    return {
      'activity': activity,
      'interest': interest,
      'icon': icon,
      'completed': completed,
      'timeAssigned': timeAssigned
    };
  }

  static Activity fromMap(Map<String, dynamic> map) {
    return Activity(
      activity: map['activity'],
      interest: map['interest'],
      icon: map['icon'],
      completed: map['completed'],
      timeAssigned: map['timeAssigned'],
    );
  }
}
