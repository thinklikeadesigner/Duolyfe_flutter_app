import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:navigationapp/buddy/services/services.dart';
import '../buddy_dao.dart';
import 'bloc.dart';

//QUESTION does the buddy need a time???
//IDEA, this can be where we can store the notification time
//MAKEME we also need to store points and treats in here somewhere
//UNPLUGGED this needs to be added to or replace the choosebuddy page

class BuddyBloc extends Bloc<BuddyEvent, BuddyState> {
  BuddyDao _buddyDao = BuddyDao();

  BuddyBloc() : super(BuddiesLoading());

  @override
  Stream<BuddyState> mapEventToState(
    BuddyEvent event,
  ) async* {
    if (event is LoadBuddies) {
      yield BuddiesLoading();
      print('buddies loading');
      yield* _reloadBuddies();
    } else if (event is ShowBuddy) {
      yield BuddiesLoading();
      print('buddies loading');
      yield* _loadBuddy();
    } else if (event is AddBuddy) {
      yield* _filterBuddiesByBuddyAndAdd(event.selectedBuddy);

    } 
    else if (event is ClearBuddies) {

   yield* _clearBuddies();
      _reloadBuddies();
    } 
    else if (event is RemoveBuddy) {

      print(event.deselectedBuddy);

      yield* _filterActivitiesAndRemove(event.deselectedBuddy);
    } 
    else if (event is DeleteBuddy) {
      event.unSelectedBuddy.selected = false;
      await _buddyDao.delete(event.unSelectedBuddy);
      yield* _reloadBuddies();
    }
  }

  Stream<BuddyState> _reloadBuddies() async* {
    final buddies = await _buddyDao.getAllSortedByName();
    // Yielding a state bundled with the Buddies from the database.
    yield BuddiesLoaded(buddies);
  }

  Stream<BuddyState> _filterBuddiesByBuddyAndAdd(String buddy) async* {
    final initialBuddies = BuddyPopulator.getFilteredBuddies(buddy);
    print(initialBuddies);
//REFACTOR can i use yield* here?
    initialBuddies.forEach((element) async {
      element.selected = true;
      await _buddyDao.insert(element);
    });
    yield BuddiesLoaded(initialBuddies);
  }


//QUESTION is this one just for testing? what is this?
  Stream<BuddyState> _loadBuddy() async* {
    final buddies = await _buddyDao.getAllSortedByName();
    // Yielding a state bundled with the Buddies from the database.
    yield BuddyLoaded(buddies[0]);
  }


  Stream<BuddyState> _clearBuddies() async* {
    final activities = await _buddyDao.getAllSortedByName();
    print('should show activities currently in activity store: $activities');
    activities.forEach((element) async {
      await _buddyDao.delete(element);
    });
    final activitiesDeleted = await _buddyDao.getAllSortedByName();
    print('activities deleted should be null: $activitiesDeleted');
    yield BuddiesDeleted();
  }


  Stream<BuddyState> _filterActivitiesAndRemove(String buddy) async* {

    List _activitiesToDelete;
    final initialBuddies = await _buddyDao.getAllSortedByName();
    _activitiesToDelete = initialBuddies
        .where((element) => element.buddy.contains(buddy))
        .toList();
    print(_activitiesToDelete);

    _activitiesToDelete.forEach((element) async {
      print(element);
      await _buddyDao.delete(element);
    });
    yield BuddiesDeleted();
  }
}






      // } else if (event is UpdateWithRandomBuddy) {
      //   final newBuddy = BuddyPopulator.getRandomBuddy();
      //   // Keeping the ID of the Buddy the same
      //   newBuddy.id = event.updatedBuddy.id;
      //   await _buddyDao.update(newBuddy);
      //   yield* _reloadBuddies();
      // }
      // //
      // else if (event is SetBuddy) {
      //   final buddies = await _buddyDao.getAllSortedByName();

      //   if (buddies != null) {
      //     _filterBuddiesByBuddyAndUpdate(event.chosenBuddy);
      //     print('buddies != null');
      //   } else {
      //     print(' null');
      //     // yield* _filterBuddiesByBuddyAndAdd(event.chosenBuddy);
      //   }
      // yield* _reloadBuddies();



      //   Stream<BuddyState> _filterBuddiesByBuddyAndUpdate(String buddy) async* {
//     print(' _filterBuddiesByBuddyAndUpdate');
//     final initialBuddies = BuddyPopulator.getFilteredBuddies(buddy);
//     print(initialBuddies);
//     final buddies = await _buddyDao.getAllSortedByName();
// //REFACTOR can i use yield* here?
//     print(buddies[0]);
//     // initialBuddies.forEach((element) async {
//     //   element.id = buddies[0].id;
//     //   await _buddyDao.update(element);
//     // });
//     yield BuddiesLoaded(initialBuddies);
//   }
