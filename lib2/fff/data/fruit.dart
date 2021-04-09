import 'package:meta/meta.dart';

class Fruit {
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Fruit.
  int id;

  final String activity;
  final String interest;
  final int icon;
  bool completed;

  Fruit(
      {@required this.activity,
      @required this.icon,
      @required this.interest,
      @required this.completed});

  Map<String, dynamic> toMap() {
    return {
      'activity': activity,
      'interest': interest,
      'icon': icon,
      'completed': completed
    };
  }

  static Fruit fromMap(Map<String, dynamic> map) {
    return Fruit(
      activity: map['activity'],
      interest: map['interest'],
      icon: map['icon'],
      completed: map['completed'],
    );
  }
}
