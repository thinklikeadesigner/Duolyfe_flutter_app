import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:navigationapp/activities/models/models.dart';
// import 'package:navigationapp/activities/services/activity_service.dart';
import 'package:navigationapp/activity/services/services.dart';
import '../activity_dao.dart';
import 'bloc.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityDao _activityDao = ActivityDao();

  ActivityBloc() : super(ActivitiesLoading());

  // Display a loading indicator right from the start of the app

  // This is where we place the logic.
  @override
  Stream<ActivityState> mapEventToState(
    ActivityEvent event,
  ) async* {
    if (event is LoadActivities) {
      // Indicating that activities are being loaded - display progress indicator.
      yield ActivitiesLoading();

      yield* _reloadActivities();
    } else if (event is AddRandomActivity) {
      final newActivity = RandomActivityGenerator.getRandomActivity();
      newActivity.timeAssigned = DateTime.now().toString();
      await _activityDao.insert(newActivity);

      yield* _reloadActivities();
    } else if (event is SubmitActivities) {
      // final newActivity = RandomActivityGenerator.getRandomActivity();

      // await _activityDao.insert(newActivity);

      yield* _reloadActivities();
    }

    // newActivity.id = event.updatedActivity.id;
    // await _activityDao.update(newActivity);
    // yield* _reloadActivities();
    // }
    else if (event is UpdateActivity) {
      event.updatedActivity.completed = !event.updatedActivity.completed;
      event.updatedActivity.timeAssigned = DateTime.now().toString();
      await _activityDao.update(event.updatedActivity);
      yield* _reloadActivities();
    } else if (event is DeleteActivity) {
      await _activityDao.delete(event.activity);
      yield* _reloadActivities();
    } else if (event is AddAllActivities) {
      yield* _preloadActivities();

      // _reloadActivities();
    } else if (event is AddFilteredActivities) {
      yield* _filterActivitiesAndAdd();
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

    // Yielding a state bundled with the Activities from the database.

    activities.forEach((element) async {
      await _activityDao.delete(element);
    });
    yield ActivitiesDeleted();
  }

  Stream<ActivityState> _preloadActivities() async* {
    final initialActivities = RandomActivityGenerator.getActivities();

    // Yielding a state bundled with the Activities from the database.
    initialActivities.forEach((element) async {
      element.timeAssigned = DateTime.now().toString();
      await _activityDao.insert(element);
    });
    yield ActivitiesLoaded(initialActivities);
  }

  Stream<ActivityState> _filterActivitiesAndAdd() async* {
    final initialActivities = RandomActivityGenerator.getFilteredActivities();

    initialActivities.forEach((element) async {
      element.timeAssigned = DateTime.now().toString();
      await _activityDao.insert(element);
    });
    yield ActivitiesLoaded(initialActivities);
  }
}

/*


done 
0xe44e

not done
0xe9bf
  
*/
