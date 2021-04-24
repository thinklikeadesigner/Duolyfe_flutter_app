import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:navigationapp/activity/services/services.dart';
import '../activity_dao.dart';
import 'bloc.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityDao _activityDao = ActivityDao();

  ActivityBloc() : super(ActivitiesLoading());

  @override
  Stream<ActivityState> mapEventToState(
    ActivityEvent event,
  ) async* {
    if (event is LoadActivities) {
      yield ActivitiesLoading();
      yield* _reloadActivities();
    } else if (event is AddRandomActivity) {
      // gets activity from List<Activity>
      final newActivity = RandomActivityGenerator.getRandomActivity();
      //IDEA should probably not modify the array directly, should get a copy and modify that
      // assigns a new time to timeAssigned
      newActivity.timeAssigned = DateTime.now().toString();
      //NOTE inserts into activity store
      await _activityDao.insert(newActivity);
      //gets all sorted by name from activity store
      yield* _reloadActivities();
    } else if (event is AddInterest) {
//TEST check if adds interest to activity store
      // add interest event carries the interest from the checkbox
      print(event.chosenInterest);
      // filter activities and add is supposed to add the activities related to that interest
      yield* _filterActivitiesByInterestAndAdd(event.chosenInterest);
    } else if (event is RemoveInterest) {
//TEST check if removes interest to activity store
      print(event.chosenInterest);
      // this should theoretically remove from the store, based on interest
      yield* _filterActivitiesAndRemove(event.chosenInterest);
    } else if (event is UpdateActivity) {
      event.updatedActivity.completed = !event.updatedActivity.completed;
      event.updatedActivity.timeAssigned = DateTime.now().toString();
      await _activityDao.update(event.updatedActivity);
      yield* _reloadActivities();
    } else if (event is DeleteActivity) {
      // IDEA do i need to delete individual activities here?
      // No, right? Because this is just setting up the store
      //  that we will use to pick 3 choices from
      await _activityDao.delete(event.activity);
      yield* _reloadActivities();
    } else if (event is AddAllActivities) {
      yield* _preloadActivities();
    } else if (event is AddFilteredActivities) {
      // yield* _filterActivitiesAndAdd();

    } else if (event is ClearActivities) {
      yield* _clearActivities();
      _reloadActivities();
    }
  }

  Stream<ActivityState> _reloadActivities() async* {
    final activities = await _activityDao.getAllSortedByName();
    // Yielding a state bundled with the Activities from the database.
    yield ActivitiesLoaded(activities);
  }

  Stream<ActivityState> _clearActivities() async* {
    final activities = await _activityDao.getAllSortedByName();
    activities.forEach((element) async {
      await _activityDao.delete(element);
    });
    yield ActivitiesDeleted();
  }

  Stream<ActivityState> _preloadActivities() async* {
    final initialActivities = RandomActivityGenerator.getActivities();

    initialActivities.forEach((element) async {
      element.timeAssigned = DateTime.now().toString();
      await _activityDao.insert(element);
    });
    yield ActivitiesLoaded(initialActivities);
  }

  // this takes from activty_service and adds fresh to the activity store
  Stream<ActivityState> _filterActivitiesByInterestAndAdd(
      String interest) async* {
    final initialActivities =
        RandomActivityGenerator.getFilteredActivities(interest);
//REFACTOR can i use yield* here?
    initialActivities.forEach((element) async {
      element.timeAssigned = DateTime.now().toString();
      await _activityDao.insert(element);
    });
    yield ActivitiesLoaded(initialActivities);
  }

  Stream<ActivityState> _filterActivitiesAndRemove(String interest) async* {
// FIXME this doesn't need to delete from the activity_service list, but from the activity store
    final initialActivities =
        RandomActivityGenerator.getFilteredActivities(interest);

    initialActivities.forEach((element) async {
      element.timeAssigned = DateTime.now().toString();
      await _activityDao.delete(element);
    });
    yield ActivitiesLoaded(initialActivities);
  }
}
