import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:navigationapp/buddys/models/models.dart';
import 'package:navigationapp/buddys/services/buddy_service.dart';
import '../buddy_dao.dart';
import 'bloc.dart';

class BuddyBloc extends Bloc<BuddyEvent, BuddyState> {
  BuddyDao _buddyDao = BuddyDao();

  BuddyBloc() : super(BuddysLoading());

  // Display a loading indicator right from the start of the app

  // This is where we place the logic.
  @override
  Stream<BuddyState> mapEventToState(
    BuddyEvent event,
  ) async* {
    if (event is LoadBuddys) {
      // Indicating that buddys are being loaded - display progress indicator.
      yield BuddysLoading();
      print('buddys loading');
      yield* _reloadBuddys();
    } else if (event is AddRandomBuddy) {
      final newBuddy = RandomBuddyGenerator.getRandomBuddy();
      //   String convertDateTimeToString(DateTime dateTime) {
//     return dateTime.toString();
//   }

//   DateTime convertStringToDateTime(String stringTime) {
//     return DateTime.parse(stringTime);
//   }
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single Buddy from the database - we aren't yielding BuddysLoading().
      await _buddyDao.insert(newBuddy);
      print('get random buddy');
      yield* _reloadBuddys();
    }
    // else if (event is UpdateWithRandomBuddy) {
    // final newBuddy = RandomBuddyGenerator.getRandomBuddy();
    // // Keeping the ID of the Buddy the same
    // newBuddy.id = event.updatedBuddy.id;
    // await _buddyDao.update(newBuddy);
    // yield* _reloadBuddys();
    // }
    else if (event is UpdateBuddy) {
      final newFruit = RandomBuddyGenerator.getRandomBuddy();
      // Keeping the ID of the Fruit the same
      newFruit.id = event.updatedBuddy.id;
      await _buddyDao.update(event.updatedBuddy);
      yield* _reloadBuddys();
    } else if (event is DeleteBuddy) {
      await _buddyDao.delete(event.buddy);
      yield* _reloadBuddys();
    }
  }

  Stream<BuddyState> _reloadBuddys() async* {
    final buddys = await _buddyDao.getAllSortedByName();
    // Yielding a state bundled with the Buddys from the database.
    yield BuddysLoaded(buddys);
  }
}
