import 'dart:math';

import '../models/task.dart';

class RandomTaskGenerator {
  static final _tasks = [
    Task(
        activity: 'Go for a walk',
        interest: 'health',
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: 'Bake a cake',
        interest: 'cooking',
        icon: 0xe477,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: 'Meditate',
        interest: 'mind',
        icon: 0xe4aa,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: 'Call a friend',
        interest: 'social',
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: 'Eat something healthy',
        interest: 'health',
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Task(
        activity: 'Solve a puzzle',
        interest: 'fun',
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
  ];

  static Task getRandomTask() {
    return _tasks[Random().nextInt(_tasks.length)];
  }
}
