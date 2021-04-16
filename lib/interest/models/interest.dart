import 'package:meta/meta.dart';

class Interest {
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Interest.
  int id;

  final String activity;
  final String interest;
  String timeAssigned;
  final int icon;
  bool completed;

  Interest(
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

  static Interest fromMap(Map<String, dynamic> map) {
    return Interest(
      activity: map['activity'],
      interest: map['interest'],
      icon: map['icon'],
      completed: map['completed'],
      timeAssigned: map['timeAssigned'],
    );
  }
}
