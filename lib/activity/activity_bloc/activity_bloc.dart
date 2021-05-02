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
    }

    else if (event is AddInterest) {


      // add interest event carries the interest from the checkbox
      print(event.chosenInterest);
      // filter activities and add is supposed to add the activities related to that interest

      yield* _filterActivitiesByInterestAndAdd(event.chosenInterest);
    } else if (event is RemoveInterest) {

    
      print(event.chosenInterest);


      yield* _filterActivitiesAndRemove(event.chosenInterest);
    } else if (event is UpdateActivity) {
      event.updatedActivity.completed = !event.updatedActivity.completed;
      event.updatedActivity.timeAssigned = DateTime.now().toString();
      print(event.updatedActivity);
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
    //NOTE this prints [instance of Activity]
    print(activities);
    // Yielding a state bundled with the Activities from the database.
    yield ActivitiesLoaded(activities);
  }

  Stream<ActivityState> _clearActivities() async* {
    final activities = await _activityDao.getAllSortedByName();
    print('should show activities currently in activity store: $activities');
    activities.forEach((element) async {
      await _activityDao.delete(element);
    });
    final activitiesDeleted = await _activityDao.getAllSortedByName();
    print('activities deleted should be null: $activitiesDeleted');
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
    print(initialActivities);
//REFACTOR can i use yield* here?
    initialActivities.forEach((element) async {

      await _activityDao.insert(element);
    });
    yield ActivitiesLoaded(initialActivities);
  }

  Stream<ActivityState> _filterActivitiesAndRemove(String interest) async* {

    List _activitiesToDelete;
    final initialActivities = await _activityDao.getAllSortedByName();
    _activitiesToDelete = initialActivities
        .where((element) => element.interest.contains(interest))
        .toList();
    print(_activitiesToDelete);

    _activitiesToDelete.forEach((element) async {
      print(element);
      await _activityDao.delete(element);
    });
    yield ActivitiesDeleted();
  }
}
