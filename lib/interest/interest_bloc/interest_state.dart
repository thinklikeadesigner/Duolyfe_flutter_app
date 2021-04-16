import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import 'package:navigationapp/interests/models/models.dart';
import 'package:navigationapp/interest/models/models.dart';

@immutable
abstract class InterestState extends Equatable {
  InterestState([List props = const []]) : super();
}

class InterestsLoading extends InterestState {
  List<Object> get props => [];
}

class InterestsLoaded extends InterestState {
  List<Object> get props => [interests];
  final List<Interest> interests;

  InterestsLoaded(this.interests) : super([interests]);
}
