import 'package:flutter_test/flutter_test.dart';
import 'package:navigationapp/strategy/AddTasks.dart';

void main() {
  group('initial values', () {
    test('initial 20s', () {
      int _health = 10;
      int _treatCount = 5;

      expect(AddTasks(_health, _treatCount).currentTreatCount, 5);
    });
    test('initial health', () {
      int _health = 10;
      int _treatCount = 5;

      expect(AddTasks(_health, _treatCount).currentHealth, 10);
    });

    test('initial treats negative', () {
      int _health = 10;
      int _treatCount = -5;

      expect(AddTasks(_health, _treatCount).currentTreatCount, 0);
    });
    test('initial health negative', () {
      int _health = -10;
      int _treatCount = 5;

      expect(AddTasks(_health, _treatCount).currentHealth, 0);
    });

    test('initial health more than 20', () {
      int _health = 200;
      int _treatCount = 5;

      expect(AddTasks(_health, _treatCount).currentHealth, 20);
    });
   test('initial treat big number', () {
      int _health = 2;
      int _treatCount = 500;

      expect(AddTasks(_health, _treatCount).currentTreatCount, 500);
    });
  });
  group('health', () {
    test('health, health 0 treat 0, add one task', () {
      int _health = 0;
      int _treatCount = 0;

 
      expect(     AddTasks(_health, _treatCount).newHealth(), 2);
    });
    test('health, health negative, treat 0, add one task', () {
      int _health = -5;
      int _treatCount = 0;

      expect(AddTasks(_health, _treatCount).newHealth(), 2);
    });
    test('health, health 20 treat 0, add one task', () {
      int _health = 0;
      int _treatCount = 0;

    
      expect(  AddTasks(_health, _treatCount).newHealth(), 2);
    });
    test('health, health 1-18, treat 0, add one task', () {
      int _health = 15;
      int _treatCount = 0;

    
      expect(  AddTasks(_health, _treatCount).newHealth(), 17);
    });
        test('health, health  19  treat 0, add one task', () {
      int _health = 19;
      int _treatCount = 0;

    
      expect(  AddTasks(_health, _treatCount).newHealth(), 20);
    });
        test('health, health 20 treat 0, add one task', () {
      int _health = 20;
      int _treatCount = 1;

    
      expect(  AddTasks(_health, _treatCount).newHealth(), 20);
    });
    });

  group('health', () {
    test('health, health 0 treat 0, add one task', () {
      int _health = 0;
      int _treatCount = 0;

 
      expect(     AddTasks(_health, _treatCount).newHealth(), 2);
    });
    test('health, health negative, treat 0, add one task', () {
      int _health = -5;
      int _treatCount = 0;

      expect(AddTasks(_health, _treatCount).newHealth(), 2);
    });
    test('health, health 20 treat 0, add one task', () {
      int _health = 0;
      int _treatCount = 0;

    
      expect(  AddTasks(_health, _treatCount).newHealth(), 2);
    });
    test('health, health 1-18, treat 0, add one task', () {
      int _health = 15;
      int _treatCount = 0;

    
      expect(  AddTasks(_health, _treatCount).newHealth(), 17);
    });
        test('health, health  19  treat 0, add one task', () {
      int _health = 19;
      int _treatCount = 0;

    
      expect(  AddTasks(_health, _treatCount).newHealth(), 20);
    });
        test('health, health 20 treat 0, add one task', () {
      int _health = 20;
      int _treatCount = 1;

    
      expect(  AddTasks(_health, _treatCount).newHealth(), 20);
    });
    });

  group('health', () {
    test('health, health 0, treat 0, add one task', () {
      int _health = 0;
      int _treatCount = 0;

 
      expect(AddTasks(_health, _treatCount).newTreat(), 0);
    });
    test('health, health 1-18, treat 0, add one task', () {
      int _health = 15;
      int _treatCount = 0;

      expect(AddTasks(_health, _treatCount).newTreat(), 0);
    });
    test('health, health 19 treat 0, add one task', () {
      int _health = 19;
      int _treatCount = 0;

    
      expect(  AddTasks(_health, _treatCount).newTreat(), 1);
    });
    test('health, health 1-18, treat 0, add one task', () {
      int _health = 20;
      int _treatCount = 0;

    
      expect(  AddTasks(_health, _treatCount).newTreat(), 1);
    });
    });




}
