import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import 'package:navigationapp/activities/models/models.dart';
import 'package:navigationapp/activity/models/models.dart';

@immutable
abstract class ActivityState extends Equatable {
  ActivityState([List props = const []]) : super();
}

class ActivitiesLoading extends ActivityState {
  List<Object> get props => [];
}

class ActivitiesLoaded extends ActivityState {
  List<Object> get props => [activities];
  final List<Activity> activities;

  ActivitiesLoaded(this.activities) : super([activities]);
}
