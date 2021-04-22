import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:navigationapp/tasks/models/models.dart';
import 'package:navigationapp/tasks/services/task_service.dart';
import '../task_dao.dart';
import 'bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskDao _taskDao = TaskDao();

  TaskBloc() : super(TasksLoading());

  // Display a loading indicator right from the start of the app

  // This is where we place the logic.
  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is LoadTasks) {
      // Indicating that tasks are being loaded - display progress indicator.
      yield TasksLoading();
      yield* _reloadTasks();
    } else if (event is AddRandomTask) {
      final newTask = RandomTaskGenerator.getRandomTask();
      newTask.timeAssigned = DateTime.now().toString();
      //   String convertDateTimeToString(DateTime dateTime) {
//     return dateTime.toString();
//   }

//   DateTime convertStringToDateTime(String stringTime) {
//     return DateTime.parse(stringTime);
//   }
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single Task from the database - we aren't yielding TasksLoading().
      await _taskDao.insert(newTask);
      yield* _reloadTasks();
    } else if (event is AddAllTasks) {
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
    else if (event is UpdateTask) {
      event.updatedTask.completed = !event.updatedTask.completed;
      event.updatedTask.timeAssigned = DateTime.now().toString();
      await _taskDao.update(event.updatedTask);
      yield* _reloadTasks();
    } else if (event is DeleteTask) {
      await _taskDao.delete(event.task);
      yield* _reloadTasks();
    } else if (event is ClearTasks) {
      yield* _clearTasks();
      _reloadTasks();
    }
  }

  Stream<TaskState> _reloadTasks() async* {
    final tasks = await _taskDao.getAllSortedByName();
    // Yielding a state bundled with the Tasks from the database.
    yield TasksLoaded(tasks);
  }

  Stream<TaskState> _clearTasks() async* {
    final tasks = await _taskDao.getAllSortedByName();
    // Yielding a state bundled with the Tasks from the database.

    tasks.forEach((element) async {
      await _taskDao.delete(element);
    });
    yield TasksDeleted();
  }

  Stream<TaskState> _preloadTasks() async* {
    final initialTasks = RandomTaskGenerator.getTask();
    // Yielding a state bundled with the Tasks from the database.
    initialTasks.forEach((element) async {
      element.timeAssigned = DateTime.now().toString();
      await _taskDao.insert(element);
    });
    yield TasksLoaded(initialTasks);
  }
}
