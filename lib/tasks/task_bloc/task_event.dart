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

class SuggestTasks extends TaskEvent {
  List<Object> get props => [];
}

class AddAllTasks extends TaskEvent {
  List<Object> get props => [];
}
class AddChosenTask extends TaskEvent {
    final Task task;
  List<Object> get props => [task];
  AddChosenTask(this.task) : super([task]);
}



class UpdateWithRandomTask extends TaskEvent {
  List<Object> get props => [updatedTask];
  final Task updatedTask;

  UpdateWithRandomTask(this.updatedTask) : super([updatedTask]);
}

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
