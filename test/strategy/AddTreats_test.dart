import 'package:navigationapp/strategy/AddTreats.dart';
import 'package:test/test.dart';

void main() {
  group('initial values', () {
    test('initial treats', () {
      int _health = 10;
      int _treatCount = 5;

      expect(AddTreats(_health, _treatCount).currentTreatCount, 5);
    });
    test('initial health', () {
      int _health = 10;
      int _treatCount = 5;

      expect(AddTreats(_health, _treatCount).currentHealth, 10);
    });

    test('initial treats negative', () {
      int _health = 10;
      int _treatCount = -5;

      expect(AddTreats(_health, _treatCount).currentTreatCount, 0);
    });
    test('initial health negative', () {
      int _health = -10;
      int _treatCount = 5;

      expect(AddTreats(_health, _treatCount).currentHealth, 0);
    });

    test('initial health more than 20', () {
      int _health = 200;
      int _treatCount = 5;

      expect(AddTreats(_health, _treatCount).currentHealth, 20);
    });
  });

  group('health', () {
    test('health, health 0 treat 0, add one treat', () {
      int _health = 0;
      int _treatCount = 0;

 
      expect(     AddTreats(_health, _treatCount).newHealth(), 0);
    });
    test('health, health 0 treat 1, add one treat', () {
      int _health = 0;
      int _treatCount = 1;

      expect(AddTreats(_health, _treatCount).newHealth(), 1);
    });
    test('health, health 20 treat 0, add one treat', () {
      int _health = 20;
      int _treatCount = 0;

    
      expect(  AddTreats(_health, _treatCount).newHealth(), 20);
    });
    test('health, health 20 treat 1, add one treat', () {
      int _health = 20;
      int _treatCount = 0;

    
      expect(  AddTreats(_health, _treatCount).newHealth(), 20);
    });
        test('health, health 25 treat 1, add one treat', () {
      int _health = 25;
      int _treatCount = 0;

    
      expect(  AddTreats(_health, _treatCount).newHealth(), 20);
    });
        test('health, health -20 treat 1, add one treat', () {
      int _health = -20;
      int _treatCount = 1;

    
      expect(  AddTreats(_health, _treatCount).newHealth(), 1);
    });
    });

    group('treat', () {
      test('treat, health 20 treat 0, add one treat', () {
        int _health = 20;
        int _treatCount = 0;

        expect(AddTreats(_health, _treatCount).newTreat(), 0);
      });
           test('treat, health 20 treat 1, add one treat', () {
        int _health = 20;
        int _treatCount = 1;

        expect(AddTreats(_health, _treatCount).newTreat(), 1);
      });
                 test('treat, health 0 treat 0, add one treat', () {
        int _health = 0;
        int _treatCount = 0;

        expect(AddTreats(_health, _treatCount).newTreat(), 0);
      });
                       test('treat, health 0 treat 1, add one treat', () {
        int _health = 0;
        int _treatCount = 1;

        expect(AddTreats(_health, _treatCount).newTreat(), 0);
      });
        test('treat, health -5 treat 1, add one treat', () {
        int _health = -5;
        int _treatCount = 1;

        expect(AddTreats(_health, _treatCount).newTreat(), 0);
      });
              test('treat, health -5 treat 0, add one treat', () {
        int _health = -5;
        int _treatCount = 0;

        expect(AddTreats(_health, _treatCount).newTreat(), 0);
      });
              test('treat, health 25 treat 1, add one treat', () {
        int _health = 25;
        int _treatCount = 1;

        expect(AddTreats(_health, _treatCount).newTreat(), 1);
      });
              test('treat, health 25 treat 0, add one treat', () {
        int _health = 25;
        int _treatCount = 0;

        expect(AddTreats(_health, _treatCount).newTreat(), 0);
      });
                    test('treat, health 25 treat -1, add one treat', () {
        int _health = 25;
        int _treatCount = -1;

        expect(AddTreats(_health, _treatCount).newTreat(), 0);
      });
                    test('treat, health 5 treat -1, add one treat', () {
        int _health = 25;
        int _treatCount = 0;

        expect(AddTreats(_health, _treatCount).newTreat(), 0);
      });
    });
     
  }

