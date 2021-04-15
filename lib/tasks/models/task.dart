import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Task extends Equatable {
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Task.
  int id;

  final String activity;
  final String interest;
  String timeAssigned;
  final int icon;
  bool completed;

  Task(
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

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      activity: map['activity'],
      interest: map['interest'],
      icon: map['icon'],
      completed: map['completed'],
      timeAssigned: map['timeAssigned'],
    );
  }

  @override
  List<Object> get props => [activity, interest, icon, completed, timeAssigned];
}
