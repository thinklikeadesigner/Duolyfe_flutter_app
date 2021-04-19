import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:navigationapp/interest/interest_dao.dart';
import 'package:navigationapp/interest/models/models.dart';
import 'package:navigationapp/interest/services/services.dart';

part 'interest_event.dart';
part 'interest_state.dart';

class InterestBloc extends Bloc<InterestEvent, InterestState> {
  InterestDao _interestDao = InterestDao();

  InterestBloc() : super(InterestsLoading());

  // Display a loading indicator right from the start of the app

  // This is where we place the logic.
  @override
  Stream<InterestState> mapEventToState(
    InterestEvent event,
  ) async* {
    if (event is LoadInterests) {
      // Indicating that interests are being loaded - display progress indicator.
      yield InterestsLoading();
      print('interests loading');
      yield* _reloadInterests();
    } else if (event is ShowInterest) {
      // Indicating that interests are being loaded - display progress indicator.
      yield InterestsLoading();
      print('interests loading');
      yield* _loadInterest();
    } else if (event is AddRandomInterest) {
      final newInterest = RandomInterestGenerator.getRandomInterest();
      // newInterest.timeAssigned = DateTime.now().toString();
      //   String convertDateTimeToString(DateTime dateTime) {
//     return dateTime.toString();
//   }

//   DateTime convertStringToDateTime(String stringTime) {
//     return DateTime.parse(stringTime);
//   }
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single Task from the database - we aren't yielding TasksLoading().
      await _interestDao.insert(newInterest);
      print('get random task');
      yield* _reloadInterests();
    }
    // Loading indicator shouldn't be displayed while adding/updating/deleting
    // a single Interest from the database - we aren't yielding InterestsLoading().
    // await _interestDao.insert(newInterest);
    // print('get random interest');
    // yield* _reloadInterests();
    // }
    else if (event is UpdateWithRandomInterest) {
      final newInterest = RandomInterestGenerator.getRandomInterest();
      // Keeping the ID of the Interest the same
      newInterest.id = event.updatedInterest.id;
      await _interestDao.update(newInterest);
      yield* _reloadInterests();
    }
    //
    else if (event is UpdateInterest) {
      event.updatedInterest.selected = !event.updatedInterest.selected;
      // event.updatedInterest.timeAssigned = DateTime.now().toString();
      await _interestDao.update(event.updatedInterest);
      yield* _reloadInterests();
    } else if (event is DeleteInterest) {
      await _interestDao.delete(event.interest);
      yield* _reloadInterests();
    } else if (event is DeleteInterest) {
      await _interestDao.delete(event.interest);
      yield* _reloadInterests();
    }
  }

  Stream<InterestState> _reloadInterests() async* {
    final interests = await _interestDao.getAllSortedByName();
    // Yielding a state bundled with the Interests from the database.
    yield InterestsLoaded(interests);
  }

  Stream<InterestState> _loadInterest() async* {
    final interests = await _interestDao.getAllSortedByName();
    // Yielding a state bundled with the Interests from the database.
    yield InterestLoaded(interests[0]);
  }
}

/*


done 
0xe44e

not done
0xe9bf
  
*/
