import 'package:navigationapp/strategy/Points.dart';

enum PointsFrom { treat, task, penalty }

class Penalty extends Points {
  Penalty(int health, int treatCount) : super(health, treatCount);

  newHealth() {
    if (currentHealth > 0) {
      if (currentHealth < 20) {
        return currentHealth = currentHealth - 1;
      } else {
        return currentHealth = 19;
      }
    } else {
      return currentHealth = 0;
    }
  }
}

// 