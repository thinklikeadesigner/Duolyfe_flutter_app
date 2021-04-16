import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import 'package:navigationapp/activities/models/models.dart';
import 'package:navigationapp/activity/models/models.dart';

@immutable
abstract class ActivityEvent extends Equatable {
  ActivityEvent([List props = const []]) : super();
}

class LoadActivities extends ActivityEvent {
  @override
  List<Object> get props => [];
}

class AddRandomActivity extends ActivityEvent {
  List<Object> get props => [];
}

// class UpdateWithRandomActivity extends ActivityEvent {
//   List<Object> get props => [updatedActivity];
//   final Activity updatedActivity;

//   UpdateWithRandomActivity(this.updatedActivity) : super([updatedActivity]);
// }

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
