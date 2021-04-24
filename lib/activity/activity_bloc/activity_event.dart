import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:navigationapp/activity/models/models.dart';

@immutable
abstract class ActivityEvent extends Equatable {
  ActivityEvent([List props = const []]) : super();
}

class LoadActivities extends ActivityEvent {
  @override
  List<Object> get props => [];
}

class AddInterest extends ActivityEvent {
  final String chosenInterest;
  @override
  List<Object> get props => [chosenInterest];
  AddInterest(this.chosenInterest) : super([chosenInterest]);
}

class RemoveInterest extends ActivityEvent {
  final String chosenInterest;
  List<Object> get props => [chosenInterest];
  RemoveInterest(this.chosenInterest) : super([chosenInterest]);
}

// FIXME i don't need to add a single activity, i just need to add the initial activities
class AddRandomActivity extends ActivityEvent {
  List<Object> get props => [];
}

// FIXME i don't need to add all activities, i just need to add the initial activities
class AddAllActivities extends ActivityEvent {
  List<Object> get props => [];
}

class AddFilteredActivities extends ActivityEvent {
  List<Object> get props => [];
}

// FIXME i don't need to update a single activity, i just need to add the initial activities
class UpdateActivity extends ActivityEvent {
  List<Object> get props => [updatedActivity];
  final Activity updatedActivity;

  UpdateActivity(this.updatedActivity) : super([updatedActivity]);
}

// FIXME i don't need to delete a single activity, i just need to add the initial activities
class DeleteActivity extends ActivityEvent {
  final Activity activity;
  List<Object> get props => [activity];
  DeleteActivity(this.activity) : super([activity]);
}

//NOTE i will probably need this so the user can change their interests later
class ClearActivities extends ActivityEvent {
  List<Object> get props => [];
  @override
  String toString() {
    return super.toString();
  }
}
