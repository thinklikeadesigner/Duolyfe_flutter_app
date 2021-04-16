import 'dart:math';

import '../models/activity.dart';

class RandomActivityGenerator {
  static final _activities = [
    Activity(
        activity: 'Go for a walk',
        interest: 'health',
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: 'Bake a cake',
        interest: 'cooking',
        icon: 0xe477,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: 'Meditate',
        interest: 'mind',
        icon: 0xe4aa,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: 'Call a friend',
        interest: 'social',
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: 'Eat something healthy',
        interest: 'health',
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Activity(
        activity: 'Solve a puzzle',
        interest: 'fun',
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
  ];

  static Activity getRandomActivity() {
    return _activities[Random().nextInt(_activities.length)];
  }
}
