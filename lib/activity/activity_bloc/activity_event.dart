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



class AddAllActivities extends ActivityEvent {
  List<Object> get props => [];
}

class AddFilteredActivities extends ActivityEvent {
  List<Object> get props => [];
}


class UpdateActivity extends ActivityEvent {
  List<Object> get props => [updatedActivity];
  final Activity updatedActivity;

  UpdateActivity(this.updatedActivity) : super([updatedActivity]);
}

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
