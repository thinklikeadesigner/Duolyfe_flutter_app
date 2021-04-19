part of 'interest_bloc.dart';

@immutable
abstract class InterestEvent extends Equatable {
  InterestEvent([List props = const []]) : super();
}

class LoadInterests extends InterestEvent {
  @override
  List<Object> get props => [];
}

class ShowInterest extends InterestEvent {
  @override
  List<Object> get props => [];
}

class AddRandomInterest extends InterestEvent {
  List<Object> get props => [];
}

class AddInterest extends InterestEvent {
  List<Object> get props => [];
}

class UpdateWithRandomInterest extends InterestEvent {
  List<Object> get props => [updatedInterest];
  final Interest updatedInterest;

  UpdateWithRandomInterest(this.updatedInterest) : super([updatedInterest]);
}

class UpdateInterest extends InterestEvent {
  List<Object> get props => [updatedInterest];
  final Interest updatedInterest;

  UpdateInterest(this.updatedInterest) : super([updatedInterest]);
}

class DeleteInterest extends InterestEvent {
  final Interest interest;
  List<Object> get props => [interest];
  DeleteInterest(this.interest) : super([interest]);
}
