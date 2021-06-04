import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:navigationapp/buddy/models/models.dart';

//REFACTOR please review these events and delete the ones that arent needed

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
  final String chosenBuddy;
  List<Object> get props => [chosenBuddy];
  AddBuddy(this.chosenBuddy) : super([chosenBuddy]);
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
