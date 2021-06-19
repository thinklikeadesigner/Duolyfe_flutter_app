// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

// import '../name.dart';

// @immutable
// abstract class NameState extends Equatable {
//   NameState([List props = const []]) : super();
// }

// class NamesLoading extends NameState {
//   List<Object> get props => [];
// }

// //FIXME this is not needed, only one name can be chosen
// //IDEA I need to figure out how to only pick one name at a time. maybe order by latest timestamp? idkkk
// class NamesLoaded extends NameState {
//   List<Object> get props => [names];
//   final List<Name> names;

//   NamesLoaded(this.names) : super([names]);
// }

// class NameLoaded extends NameState {
//   List<Object> get props => [name];
//   final Name name;

//   NameLoaded(this.name) : super([name]);
// }

// class NamesDeleted extends NameState {
//   List<Object> get props => [];
// }
