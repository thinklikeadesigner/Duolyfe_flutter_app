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
      print('activities loading');
      yield* _reloadActivities();
    } else if (event is AddRandomActivity) {
      final newActivity = RandomActivityGenerator.getRandomActivity();
      newActivity.timeAssigned = DateTime.now().toString();
      await _activityDao.insert(newActivity);
      print('get random activity');
      yield* _reloadActivities();
    } else if (event is SubmitActivities) {
      // final newActivity = RandomActivityGenerator.getRandomActivity();
      print(event.chosenActivities);

      // await _activityDao.insert(newActivity);
      // print('get random activity');
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
      yield* _preloadTasks();
      // yield* _reloadTasks();
    }
    // else if (event is UpdateWithRandomTask) {
    // final newTask = RandomTaskGenerator.getRandomTask();
    // // Keeping the ID of the Task the same
    // newTask.id = event.updatedTask.id;
    // await _taskDao.update(newTask);
    // yield* _reloadTasks();
    // }

    else if (event is ClearActivities) {
      print('clearing activities');
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
    print(activities);
    // Yielding a state bundled with the Activities from the database.

    activities.forEach((element) async {
      print('deleting');
      await _activityDao.delete(element);
    });
    yield ActivitiesDeleted();
  }

  Stream<ActivityState> _preloadTasks() async* {
    final initialTasks = RandomActivityGenerator.getActivity();
    print(initialTasks);
    // Yielding a state bundled with the Tasks from the database.
    initialTasks.forEach((element) async {
      print('hi');
      element.timeAssigned = DateTime.now().toString();
      await _activityDao.insert(element);
    });
    yield ActivitiesLoaded(initialTasks);
  }
}

/*


done 
0xe44e

not done
0xe9bf
  
*/
