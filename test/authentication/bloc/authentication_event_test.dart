// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:navigationapp/authentication/authentication.dart';

void main() {
  group('AuthenticationEvent', () {
    group('LoggedOut', () {
      test('supports value comparisons', () {
        expect(
          AuthenticationLogoutRequested(),
          AuthenticationLogoutRequested(),
        );
      });
    });

    group('AuthenticationUserChanged', () {
      test('supports value comparisons', () {
        expect(
          AuthenticationUserChanged(null),
          AuthenticationUserChanged(null),
        );
      });
    });
  });
}
