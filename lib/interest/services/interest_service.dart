import 'dart:math';

import '../models/interest.dart';

class RandomInterestGenerator {
  static final _interests = [
    Interest(
        activity: 'Go for a walk',
        interest: 'health',
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Interest(
        activity: 'Bake a cake',
        interest: 'cooking',
        icon: 0xe477,
        completed: false,
        timeAssigned: ""),
    Interest(
        activity: 'Meditate',
        interest: 'mind',
        icon: 0xe4aa,
        completed: false,
        timeAssigned: ""),
    Interest(
        activity: 'Call a friend',
        interest: 'social',
        icon: 0xe3e1,
        completed: false,
        timeAssigned: ""),
    Interest(
        activity: 'Eat something healthy',
        interest: 'health',
        icon: 0xe4f8,
        completed: false,
        timeAssigned: ""),
    Interest(
        activity: 'Solve a puzzle',
        interest: 'fun',
        icon: 0xe5b1,
        completed: false,
        timeAssigned: ""),
  ];

  static Interest getRandomInterest() {
    return _interests[Random().nextInt(_interests.length)];
  }
}
