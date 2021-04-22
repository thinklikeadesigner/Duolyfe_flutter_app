import 'dart:math';

import '../models/interest.dart';

class RandomInterestGenerator {
  static final _interests = [
    Interest(
      interest: 'cooking',
      selected: false,
    ),
    Interest(
      interest: 'fun',
      selected: false,
    ),
    Interest(
      interest: 'health',
      selected: false,
    ),
    Interest(
      interest: 'indoor',
      selected: false,
    ),
    Interest(
      interest: 'mind',
      selected: false,
    ),
    Interest(
      interest: 'outdoor',
      selected: false,
    ),
    Interest(
      interest: 'personal development',
      selected: false,
    ),
    Interest(
      interest: 'social',
      selected: false,
    ),
  ];

  static Interest getRandomInterest() {
    return _interests[Random().nextInt(_interests.length)];
  }
}
