import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:navigationapp/activity/models/models.dart';

@immutable
abstract class ActivityState extends Equatable {
  ActivityState([List props = const []]) : super();
}

//activities will load to display the 3 choices here
class ActivitiesLoading extends ActivityState {
  List<Object> get props => [];
}

class ActivitiesLoaded extends ActivityState {
  //BUG this runs twice
  final List<Activity> activities;

  ActivitiesLoaded(this.activities) : super([activities]);
  List<Object> get props => [activities];
}

//NOTE do i need an activities deleted?
class ActivitiesDeleted extends ActivityState {
  List<Object> get props => [];
}
