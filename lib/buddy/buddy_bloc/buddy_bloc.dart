import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:navigationapp/buddies/models/models.dart';
// import 'package:navigationapp/buddies/services/buddy_service.dart';
import 'package:navigationapp/buddy/services/services.dart';
import '../buddy_dao.dart';
import 'bloc.dart';

class BuddyBloc extends Bloc<BuddyEvent, BuddyState> {
  BuddyDao _buddyDao = BuddyDao();

  BuddyBloc() : super(BuddiesLoading());

  // Display a loading indicator right from the start of the app

  // This is where we place the logic.
  @override
  Stream<BuddyState> mapEventToState(
    BuddyEvent event,
  ) async* {
    if (event is LoadBuddies) {
      // Indicating that buddies are being loaded - display progress indicator.
      yield BuddiesLoading();
      print('buddies loading');
      yield* _reloadBuddies();
    } else if (event is ShowBuddy) {
      // Indicating that buddies are being loaded - display progress indicator.
      yield BuddiesLoading();
      print('buddies loading');
      yield* _loadBuddy();
    } else if (event is AddRandomBuddy) {
      final newBuddy = RandomBuddyGenerator.getRandomBuddy();
      // newBuddy.timeAssigned = DateTime.now().toString();
      //   String convertDateTimeToString(DateTime dateTime) {
//     return dateTime.toString();
//   }

//   DateTime convertStringToDateTime(String stringTime) {
//     return DateTime.parse(stringTime);
//   }
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single Task from the database - we aren't yielding TasksLoading().
      await _buddyDao.insert(newBuddy);
      print('get random task');
      yield* _reloadBuddies();
    }
    // Loading indicator shouldn't be displayed while adding/updating/deleting
    // a single Buddy from the database - we aren't yielding BuddiesLoading().
    // await _buddyDao.insert(newBuddy);
    // print('get random buddy');
    // yield* _reloadBuddies();
    // }
    else if (event is UpdateWithRandomBuddy) {
      final newBuddy = RandomBuddyGenerator.getRandomBuddy();
      // Keeping the ID of the Buddy the same
      newBuddy.id = event.updatedBuddy.id;
      await _buddyDao.update(newBuddy);
      yield* _reloadBuddies();
    }
    //
    else if (event is UpdateBuddy) {
      event.updatedBuddy.selected = !event.updatedBuddy.selected;
      // event.updatedBuddy.timeAssigned = DateTime.now().toString();
      await _buddyDao.update(event.updatedBuddy);
      yield* _reloadBuddies();
    } else if (event is DeleteBuddy) {
      await _buddyDao.delete(event.buddy);
      yield* _reloadBuddies();
    } else if (event is DeleteBuddy) {
      await _buddyDao.delete(event.buddy);
      yield* _reloadBuddies();
    }
  }

  Stream<BuddyState> _reloadBuddies() async* {
    final buddies = await _buddyDao.getAllSortedByName();
    // Yielding a state bundled with the Buddies from the database.
    yield BuddiesLoaded(buddies);
  }

  Stream<BuddyState> _loadBuddy() async* {
    final buddies = await _buddyDao.getAllSortedByName();
    // Yielding a state bundled with the Buddies from the database.
    yield BuddyLoaded(buddies[0]);
  }
}

/*


done 
0xe44e

not done
0xe9bf
  
*/
