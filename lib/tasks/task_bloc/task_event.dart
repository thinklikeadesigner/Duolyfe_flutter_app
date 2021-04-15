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

class AddRandomTask extends TaskEvent {
  List<Object> get props => [];
}

// class UpdateWithRandomTask extends TaskEvent {
//   List<Object> get props => [updatedTask];
//   final Task updatedTask;

//   UpdateWithRandomTask(this.updatedTask) : super([updatedTask]);
// }

class UpdateTask extends TaskEvent {
  List<Object> get props => [updatedTask];
  final Task updatedTask;

  UpdateTask(this.updatedTask) : super([updatedTask]);
}

class DeleteTask extends TaskEvent {
  final Task task;
  List<Object> get props => [task];
  DeleteTask(this.task) : super([task]);
}
