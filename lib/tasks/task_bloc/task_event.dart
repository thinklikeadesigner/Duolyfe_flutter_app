import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:navigationapp/tasks/models/models.dart';

@immutable
abstract class TaskEvent extends Equatable {
  TaskEvent([List props = const []]) : super();
}

class LoadTasks extends TaskEvent {
  @override
  List<Object> get props => [];
}

//NEED change to add task from activity store event AND RANDOMIZE
class AddRandomTask extends TaskEvent {
  List<Object> get props => [];
}

//NOTE adds all tasks from activity store, different root
class AddAllTasks extends TaskEvent {
  List<Object> get props => [];
}

//TEST USE RANDOM EVENT TO TEST SELECTING ACTIVITY ON HOMEPAGE
class UpdateWithRandomTask extends TaskEvent {
  List<Object> get props => [updatedTask];
  final Task updatedTask;

  UpdateWithRandomTask(this.updatedTask) : super([updatedTask]);
}

//SPECS this will update completion status
//IDEA should there be an event that updates point status?
class UpdateTask extends TaskEvent {
  List<Object> get props => [updatedTask];
  final Task updatedTask;

  UpdateTask(this.updatedTask) : super([updatedTask]);
}

//SPECS option for user to delete task if they don't like it or change their mind
class DeleteTask extends TaskEvent {
  final Task task;
  List<Object> get props => [task];
  DeleteTask(this.task) : super([task]);
}

//NOTE this is for testing purposes
class ClearTasks extends TaskEvent {
  List<Object> get props => [];
  @override
  String toString() {
    return super.toString();
  }
}
