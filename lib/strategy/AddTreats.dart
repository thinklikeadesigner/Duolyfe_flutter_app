import 'package:navigationapp/strategy/Strategy.dart';

enum PointsFrom { treat, task, penalty }


class AddTreats extends Points {
  AddTreats(int health, int treatCount) : super(health, treatCount);

  newHealth() {
    if (currentTreatCount > 0) {

      // we have treats, so now we check health
      if (currentHealth >= 20) {
        //current health full, health stays the same
          return currentHealth;
      } else {
        // health not full, increase health
      return currentHealth + 1;
      }
    } else {
// no treats, health stays the same
    return currentHealth;
    }
  }

  newTreat() {
    if (currentTreatCount > 0) {
      // we have treats, so check if health full
      if (currentHealth >= 20) {
         // health full, treatCount doesnt change
        return currentTreatCount;
      } else {
// health not full, treatCount goes down
        currentTreatCount -= 1;
      }
    
    }
    // we don't have treats, so treatCount doesn't change
    return currentTreatCount;
  

  }
}

class AddTasks extends Points {
  AddTasks(int health, int treatCount) : super(health, treatCount);
}


  
  
  //  set pointsAndHealth(int points) {
//   _health = _checkHealth(points);
//   _treatCount = _checkTreats(points);
// }

// int addTreat() {
//   print('add treat with 1 point');
//   return 1;
// }
// int addTaskPoints() {
//   print('add task with 2 points');
//   return 2;
// }
// int subtractDayPoints() {
//   print('subtracttion penalty of 1');
//   return -1;
// }

//   // CONSTRAINTS
//   // health cant be < 0
//   // health cant be > 20
//   // treatCount can't be < 0

//   // CASES

//   // addTreat
//   // health == 0 && treatcount == 0
//   // expect health = health, treatcount = treatcount

//   // addTreat
//   // health == 1 - 9 && treatcount == 0
//   // expect health = health, treatcount = treatcount

//   // addTreat
//   // health == 20 && treatcount == 0
//   // expect health = health, treatcount = treatcount

//   // addTreat
//   // health == 0 && treatcount > 0
//   // expect health += 1, treatcount -= 1

//   // addTreat
//   // health == 1 - 19 && treatcount > 0
//   // expect health += 1, treatcount -= 1

//   // addTreat
//   // health == 20 && treatcount > 0
//   // expect health = health, treatcount = treatcount

//   // addTask
//   // health == 0 && treatcount == 0
//   // health == 1 - 9 && treatcount == 0
//   // health == 20 && treatcount == 0
//   // health == 0 && treatcount > 0
//   // health == 1 - 9 && treatcount > 0
//   // health == 20 && treatcount > 0

//     // addPenalty
//   // health == 0 && treatcount == 0
//   // health == 1 - 9 && treatcount == 0
//   // health == 20 && treatcount == 0
//   // health == 0 && treatcount > 0
//   // health == 1 - 9 && treatcount > 0
//   // health == 20 && treatcount > 0

//   // VALUES
//   // health
//   // treatCount

//   // TYPES
//   // points.treat
//   // points.task
//   // points.penalty

// //     switch (pointsType) {
// //   case PointsFrom.treat:
// //     print('Red as roses!');
// //     break;
// //   case PointsFrom.task:
// //     print('Green as grass!');
// //     break;
// //       case PointsFrom.penalty:
// //     print('Green as grass!');
// //     break;
// //   default: // Without this, you see a WARNING.
// //     print(pointsType); // 'Color.blue'
// // }

//     int checkHealth(int points) {
//     if (_health + points >= 20) {
//       final newHealth = _health + points;
//       _treatCount -= newHealth - 20;
//       if (_treatCount <= 0) {
//         _treatCount = 0;
//       }

//       _health = 20;

//       print(_health);
//       print(_treatCount);
//       return _health;
//     } else if (_health + points <= 0) {
//       _health = 0;
//       return _health;
//     } else {
//       _health += points;
//       return _health;
//     }
//   }

//   void printHealth() {
//     print('new health is: $_health');
//   }

//   void printTreats() {
//     print('new treat count is: $_treatCount');
//   }
  

