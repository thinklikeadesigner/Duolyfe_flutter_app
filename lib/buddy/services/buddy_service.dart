import 'dart:math';

import '../models/buddy.dart';

//MAKEME add treats and points and health to buddy here too
class RandomBuddyGenerator {
  static final _buddies = [
    Buddy(
      buddy: 'chick.png',
      selected: false,
    ),
    Buddy(
      buddy: 'deer.png',
      selected: false,
    ),
    Buddy(
      buddy: 'cow.png',
      selected: false,
    ),
    Buddy(
      buddy: 'koala.png',
      selected: false,
    ),
    Buddy(
      buddy: 'fox.png',
      selected: false,
    ),
    Buddy(
      buddy: 'sheep.png',
      selected: false,
    ),
    Buddy(
      buddy: 'mouse.png',
      selected: false,
    ),
    Buddy(
      buddy: 'giraffe.png',
      selected: false,
    ),
    Buddy(
      buddy: 'panda.png',
      selected: false,
    ),
    Buddy(
      buddy: 'bear.png',
      selected: false,
    ),
    Buddy(
      buddy: 'pig.png',
      selected: false,
    ),
    Buddy(
      buddy: 'brownDog.png',
      selected: false,
    ),
    Buddy(
      buddy: 'tiger.png',
      selected: false,
    ),
    Buddy(
      buddy: 'racoon.png',
      selected: false,
    ),
    Buddy(
      buddy: 'cat.png',
      selected: false,
    ),
    Buddy(
      buddy: 'hamster.png',
      selected: false,
    ),
    Buddy(
      buddy: 'wolf.png',
      selected: false,
    ),
    Buddy(
      buddy: 'yellowDog.png',
      selected: false,
    )
  ];

  static Buddy getRandomBuddy() {
    return _buddies[Random().nextInt(_buddies.length)];
  }
}
