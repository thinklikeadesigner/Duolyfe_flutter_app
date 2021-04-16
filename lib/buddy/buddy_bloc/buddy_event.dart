import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import 'package:navigationapp/buddies/models/models.dart';
import 'package:navigationapp/buddy/models/models.dart';

@immutable
abstract class BuddyEvent extends Equatable {
  BuddyEvent([List props = const []]) : super();
}

class LoadBuddies extends BuddyEvent {
  @override
  List<Object> get props => [];
}

class ShowBuddy extends BuddyEvent {
  @override
  List<Object> get props => [];
}

class AddRandomBuddy extends BuddyEvent {
  List<Object> get props => [];
}

class AddBuddy extends BuddyEvent {
  List<Object> get props => [];
}

class UpdateWithRandomBuddy extends BuddyEvent {
  List<Object> get props => [updatedBuddy];
  final Buddy updatedBuddy;

  UpdateWithRandomBuddy(this.updatedBuddy) : super([updatedBuddy]);
}

class UpdateBuddy extends BuddyEvent {
  List<Object> get props => [updatedBuddy];
  final Buddy updatedBuddy;

  UpdateBuddy(this.updatedBuddy) : super([updatedBuddy]);
}

class DeleteBuddy extends BuddyEvent {
  final Buddy buddy;
  List<Object> get props => [buddy];
  DeleteBuddy(this.buddy) : super([buddy]);
}
