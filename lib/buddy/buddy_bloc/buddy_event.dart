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
  final String selectedBuddy;
  List<Object> get props => [selectedBuddy];
  AddBuddy(this.selectedBuddy) : super([selectedBuddy]);
}

class UpdateWithRandomBuddy extends BuddyEvent {
  List<Object> get props => [updatedBuddy];
  final Buddy updatedBuddy;

  UpdateWithRandomBuddy(this.updatedBuddy) : super([updatedBuddy]);
}

class SetBuddy extends BuddyEvent {
  final String chosenBuddy;
  List<Object> get props => [chosenBuddy];
  SetBuddy(this.chosenBuddy) : super([chosenBuddy]);
}

class RemoveBuddy extends BuddyEvent {
  final String deselectedBuddy;
  List<Object> get props => [deselectedBuddy];
  RemoveBuddy(this.deselectedBuddy) : super([deselectedBuddy]);
}

class DeleteBuddy extends BuddyEvent {
  final Buddy unSelectedBuddy;
  List<Object> get props => [unSelectedBuddy];
  DeleteBuddy(this.unSelectedBuddy) : super([unSelectedBuddy]);
}

class ClearBuddies extends BuddyEvent {
  List<Object> get props => [];
  @override
  String toString() {
    return super.toString();
  }
}
