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

class TasksDeleted extends TaskState {
  List<Object> get props => [];
}
