part of 'interest_bloc.dart';

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

class InterestLoaded extends InterestState {
  List<Object> get props => [interest];
  final Interest interest;

  InterestLoaded(this.interest) : super([interest]);
}
