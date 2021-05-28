import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:navigationapp/activity/activity_dao.dart';
import 'package:navigationapp/tasks/services/task_service.dart';
import '../task_dao.dart';
import 'bloc.dart';

//SPECS this should save completion status and time
////       // newTask.timeAssigned = DateTime.now().toString();
// 
      //   String convertDateTimeToString(DateTime dateTime) {
//     return dateTime.toString();
//   }

//   DateTime convertStringToDateTime(String stringTime) {
//     return DateTime.parse(stringTime);
//   }


//IDEA this should tell buddy that it needs to increment points

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskDao _taskDao = TaskDao();
  ActivityDao _activityDao = ActivityDao();

  TaskBloc() : super(TasksLoading());


  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is LoadTasks) {
      yield TasksLoading();
      yield* _reloadTasks();
    } else if (event is SuggestTasks) {


      yield* _showSuggestedTasks();
    } else if (event is AddAllTasks) {
      yield* _preloadTasks();
      // yield* _reloadTasks();
    }

    else if (event is UpdateTask) {
      event.updatedTask.completed = !event.updatedTask.completed;
      event.updatedTask.timeAssigned = DateTime.now().toString();
      await _taskDao.update(event.updatedTask);
      yield* _reloadTasks();
    } else if (event is DeleteTask) {
      await _taskDao.delete(event.task);
      yield* _reloadTasks();
    } else if (event is AddChosenTask) {
      //QUESTION do we need to add the time
       event.task.timeAssigned = DateTime.now().toString();
      await _taskDao.insert(event.task);
      yield* _reloadTasks();
    } else if (event is ClearTasks) {
      yield* _clearTasks();
      _reloadTasks();
    }
  }

  Stream<TaskState> _reloadTasks() async* {
    final tasks = await _taskDao.getAllSortedByName();
    
    yield TasksLoaded(tasks);
  }

  Stream<TaskState> _showSuggestedTasks() async* {
    

    final firstSuggestion = await _activityDao
        .getAllSortedByName()
        .then((value) => value[Random().nextInt(value.length)]);
    final secondSuggestion = await _activityDao
        .getAllSortedByName()
        .then((value) => value[Random().nextInt(value.length)]);
            final thirdSuggestion = await _activityDao
        .getAllSortedByName()
        .then((value) => value[Random().nextInt(value.length)]);

    


    yield TaskDisplayed([firstSuggestion, secondSuggestion, thirdSuggestion]);
  }

  Stream<TaskState> _clearTasks() async* {
    final tasks = await _taskDao.getAllSortedByName();

    tasks.forEach((element) async {
      await _taskDao.delete(element);
    });
    yield TasksDeleted();
  }

  Stream<TaskState> _preloadTasks() async* {
    final initialTasks = RandomTaskGenerator.getTask();
    initialTasks.forEach((element) async {
      element.timeAssigned = DateTime.now().toString();
      await _taskDao.insert(element);
    });
    yield TasksLoaded(initialTasks);
  }
}
