import 'dart:math';

import '../models/buddy.dart';

class RandomBuddyGenerator {
  static final _buddys = [
    Buddy(
      buddy: 'panda.png',
      selected: false,
    ),
    Buddy(
      buddy: 'giraffe.png',
      selected: false,
    ),
    Buddy(
      buddy: 'cow.png',
      selected: false,
    ),
    Buddy(
      buddy: 'deer.png',
      selected: false,
    ),
    Buddy(
      buddy: 'sheep.png',
      selected: false,
    ),
    Buddy(
      buddy: 'racoon.png',
      selected: false,
    ),
  ];

  static Buddy getRandomBuddy() {
    return _buddys[Random().nextInt(_buddys.length)];
  }
}
