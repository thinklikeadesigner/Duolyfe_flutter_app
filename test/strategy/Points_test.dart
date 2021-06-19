import 'package:navigationapp/strategy/Points.dart';
import 'package:test/test.dart';

void main() {
  group('Initial values', () {
    test('initial health', () {
      int _health = 10;
      int _treatCount = 5;

      expect(Points(_health, _treatCount).currentHealth, 10);
    });
    test('initial treatCount', () {
      int _health = 10;
      int _treatCount = 5;
      expect(Points(_health, _treatCount).currentTreatCount, 5);
    });
  });

  group('Add treat', () {
    test('health when health negative', () {
      int _health = -10;
      int _treatCount = 0;

      Points _points = Points(_health, _treatCount);

      expect(_points.currentHealth, 0);
    });
    test('treatCount when treatCount negative', () {
      int _health = 10;
      int _treatCount = 0;
Points _points = Points(_health, _treatCount);
      expect(_points.currentTreatCount, 0);
    });
        test('health when health 0', () {
      int _health = 0;
      int _treatCount = 0;

      Points _points = Points(_health, _treatCount);

      expect(_points.currentHealth, 0);
    });
    test('treatCount when treatCount 0', () {
      int _health = 10;
      int _treatCount = -10;
Points _points = Points(_health, _treatCount);
      expect(_points.currentTreatCount, 0);
    });

        test('health when health 5', () {
      int _health = 5;
      int _treatCount = 0;

      Points _points = Points(_health, _treatCount);

      expect(_points.currentHealth, 5);
    });
    test('treatCount when treatCount 5', () {
      int _health = 10;
      int _treatCount = 5;
Points _points = Points(_health, _treatCount);
      expect(_points.currentTreatCount, 5);
    });

            test('health when health > 20', () {
      int _health = 25;
      int _treatCount = 0;

      Points _points = Points(_health, _treatCount);

      expect(_points.currentHealth, 20);
    });
//     test('treatCount when health == 0 && treatCount == 0', () {
//       int _health = 10;
//       int _treatCount = 5;
// Points _points = Points(_health, _treatCount);
//       expect(_points.currentTreatCount, 0);
//     });
//     test('treatCount when health == 0 && treatCount == 0', () {
//       int _health = 10;
//       int _treatCount = 5;
// Points _points = Points(_health, _treatCount);
//       expect(_points.currentTreatCount, 0);
//     });
    //    test('add treat when health == 0 && treat == 0', () {
    //     int health = 0;
    //     int treatCount = 0;

    //     expect(treatCount, 0);
    //   });

    //   test('value should be incremented', () {
    //     final counter = Counter();

    //     counter.increment();

    //     expect(counter.value, 1);
    //   });

    //   test('value should be decremented', () {
    //     final counter = Counter();

    //     counter.decrement();

    //     expect(counter.value, -1);
    //   });
  });
}
