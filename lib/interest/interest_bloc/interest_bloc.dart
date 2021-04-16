import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:navigationapp/interests/models/models.dart';
// import 'package:navigationapp/interests/services/interest_service.dart';
import 'package:navigationapp/interest/services/services.dart';
import '../interest_dao.dart';
import 'bloc.dart';

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
    } else if (event is AddRandomInterest) {
      final newInterest = RandomInterestGenerator.getRandomInterest();
      newInterest.timeAssigned = DateTime.now().toString();
      //   String convertDateTimeToString(DateTime dateTime) {
//     return dateTime.toString();
//   }

//   DateTime convertStringToDateTime(String stringTime) {
//     return DateTime.parse(stringTime);
//   }
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single Interest from the database - we aren't yielding InterestsLoading().
      await _interestDao.insert(newInterest);
      print('get random interest');
      yield* _reloadInterests();
    }
    // else if (event is UpdateWithRandomInterest) {
    // final newInterest = RandomInterestGenerator.getRandomInterest();
    // // Keeping the ID of the Interest the same
    // newInterest.id = event.updatedInterest.id;
    // await _interestDao.update(newInterest);
    // yield* _reloadInterests();
    // }
    else if (event is UpdateInterest) {
      event.updatedInterest.completed = !event.updatedInterest.completed;
      event.updatedInterest.timeAssigned = DateTime.now().toString();
      await _interestDao.update(event.updatedInterest);
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
}

/*


done 
0xe44e

not done
0xe9bf
  
*/
