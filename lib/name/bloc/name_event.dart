// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

// import '../name.dart';

// //REFACTOR please review these events and delete the ones that arent needed

// @immutable
// abstract class NameEvent extends Equatable {
//   NameEvent([List props = const []]) : super();
// }

// class LoadNames extends NameEvent {
//   @override
//   List<Object> get props => [];
// }

// class ShowName extends NameEvent {
//   @override
//   List<Object> get props => [];
// }

// class AddRandomName extends NameEvent {
//   List<Object> get props => [];
// }

// class AddName extends NameEvent {
//   final String selectedName;
//   List<Object> get props => [selectedName];
//   AddName(this.selectedName) : super([selectedName]);
// }

// class UpdateWithRandomName extends NameEvent {
//   List<Object> get props => [updatedName];
//   final Name updatedName;

//   UpdateWithRandomName(this.updatedName) : super([updatedName]);
// }

// class SetName extends NameEvent {
//   final String chosenName;
//   List<Object> get props => [chosenName];
//   SetName(this.chosenName) : super([chosenName]);
// }

// class RemoveName extends NameEvent {
//   final String deselectedName;
//   List<Object> get props => [deselectedName];
//   RemoveName(this.deselectedName) : super([deselectedName]);
// }

// class DeleteName extends NameEvent {
//   final Name unSelectedName;
//   List<Object> get props => [unSelectedName];
//   DeleteName(this.unSelectedName) : super([unSelectedName]);
// }


