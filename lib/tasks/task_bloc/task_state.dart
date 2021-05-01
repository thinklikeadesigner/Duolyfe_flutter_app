import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:navigationapp/tasks/models/models.dart';

@immutable
abstract class TaskState extends Equatable {
  TaskState([List props = const []]) : super();
}

class TasksLoading extends TaskState {
  List<Object> get props => [];
}

class TasksLoaded extends TaskState {
  List<Object> get props => [tasks];
  final List<Task> tasks;

  TasksLoaded(this.tasks) : super([tasks]);
}



//IDEA add a task completed state for disabling task card?
class TasksDeleted extends TaskState {
  List<Object> get props => [];
}
class TaskDisplayed extends TaskState {
    List<Object> get props => [task];
  final Task task;

  TaskDisplayed(this.task) : super([task]);
}
