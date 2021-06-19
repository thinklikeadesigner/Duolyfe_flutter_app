import 'package:navigationapp/strategy/Points.dart';

enum PointsFrom { treat, task, penalty }

class AddTasks extends Points {
  AddTasks(int health, int treatCount) : super(health, treatCount);

  newHealth() {
    if (currentHealth > 0) {
      if (currentHealth <= 18) {
        return currentHealth + 2;
      } else if (currentHealth == 19) {
        return currentHealth = 20;
      } else {
        return currentHealth = 20;
      }
    } else {
      return currentHealth + 2;
    }
  }

  newTreat() {
    if (currentHealth > 0) {
      if (currentHealth <= 18) {
        return currentTreatCount;
      } else if (currentHealth == 19) {
        return currentTreatCount + 1;
      } else {
        return currentTreatCount + 1;
      }
    } else {
      return currentTreatCount;
    }
  }
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

//   // VALUES that we are keeping track of
//   // health
//   // treatCount

// ACTIONS
// user can complete a task | health goes up by 2hp
// user has daily penalty | health goes down by 1hp
// user can use a treat (consumeable) | health goes up by 1hp

// extra info, if user is at full health (20hp), 
// each additional task adds 1 to treatcount

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
// expect health == 2 && treatcount == treatcount

//   // addTask
//   // health == 1 - 19 && treatcount == 0 
// expect health == 20 && treatcount == 1

//   // addTask
//   // health == 20 && treatcount == 0 then health == 20 && treacount == 2
// expect health == 20 && treatcount == 2


//   // addTask
//   // health == 0 && treatcount > 0
// expect health == 2 && treatcount == treatcount

//   // addTask
//   // health == 1 - 9 && treatcount > 0
// expe

//   // addTask
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
  

