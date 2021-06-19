import 'package:flutter_test/flutter_test.dart';
import 'package:navigationapp/strategy/Penalty.dart';

void main() {
  group('initial values', () {
    test('initial 20s', () {
      int _health = 10;
      int _treatCount = 5;

      expect(Penalty(_health, _treatCount).currentTreatCount, 5);
    });
    test('initial health', () {
      int _health = 10;
      int _treatCount = 5;

      expect(Penalty(_health, _treatCount).currentHealth, 10);
    });

    test('initial treats negative', () {
      int _health = 10;
      int _treatCount = -5;

      expect(Penalty(_health, _treatCount).currentTreatCount, 0);
    });
    test('initial health negative', () {
      int _health = -10;
      int _treatCount = 5;

      expect(Penalty(_health, _treatCount).currentHealth, 0);
    });

    test('initial health more than 20', () {
      int _health = 200;
      int _treatCount = 5;

      expect(Penalty(_health, _treatCount).currentHealth, 20);
    });
    test('initial treat big number', () {
      int _health = 2;
      int _treatCount = 500;

      expect(Penalty(_health, _treatCount).currentTreatCount, 500);
    });
  });
  group('health', () {
    test('health, health 0 treat 0, daily penalty', () {
      int _health = 0;
      int _treatCount = 0;

      expect(Penalty(_health, _treatCount).newHealth(), 0);
    });
    test('health, health negative, treat 0, daily penalty', () {
      int _health = -5;
      int _treatCount = 0;

      expect(Penalty(_health, _treatCount).newHealth(), 0);
    });
    test('health, health 15 treat 0, daily penalty', () {
      int _health = 15;
      int _treatCount = 0;

      expect(Penalty(_health, _treatCount).newHealth(), 14);
    });
    test('health, health 20, treat 0, daily penalty', () {
      int _health = 20;
      int _treatCount = 0;

      expect(Penalty(_health, _treatCount).newHealth(), 19);
    });
    test('health, health  20+  treat 0, daily penalty', () {
      int _health = 201;
      int _treatCount = 0;

      print('penaltyyyyyyypenaltyyyyyyypenaltyyyyyyypenaltyyyyyyypenaltyyyyyyypenaltyyyyyyypenaltyyyyyyypenaltyyyyyyypenaltyyyyyyypenaltyyyyyyypenaltyyyyyyypenaltyyyyyyy ${Penalty(_health, _treatCount).newHealth()}');

      expect(Penalty(_health, _treatCount).newHealth(), 19);
    });

  });

}
