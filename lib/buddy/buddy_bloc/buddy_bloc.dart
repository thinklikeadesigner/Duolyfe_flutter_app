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

      print(event.chosenBuddy);


      yield* _filterBuddiesByBuddyAndAdd(event.chosenBuddy);


    } else if (event is UpdateWithRandomBuddy) {
      final newBuddy = BuddyPopulator.getRandomBuddy();
      // Keeping the ID of the Buddy the same
      newBuddy.id = event.updatedBuddy.id;
      await _buddyDao.update(newBuddy);
      yield* _reloadBuddies();
    }
    //
    else if (event is UpdateBuddy) {


/*
psuedocode

if (buddy) {
filter buddies by buddy and update that buddy with the filtered buddy
} else {
    yield* _filterBuddiesByBuddyAndAdd(event.chosenBuddy);
}





*/







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

  // this takes from activty_service and adds fresh to the activity store
  Stream<BuddyState> _filterBuddiesByBuddyAndAdd(String buddy) async* {
    final initialBuddies = BuddyPopulator.getFilteredBuddies(buddy);
    print(initialBuddies);
//REFACTOR can i use yield* here?
    initialBuddies.forEach((element) async {
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
}
