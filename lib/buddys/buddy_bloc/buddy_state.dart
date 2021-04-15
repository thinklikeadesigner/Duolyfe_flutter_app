import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:navigationapp/buddys/models/models.dart';

@immutable
abstract class BuddyState extends Equatable {
  BuddyState([List props = const []]) : super();
}

class BuddysLoading extends BuddyState {
  List<Object> get props => [];
}

class BuddysLoaded extends BuddyState {
  List<Object> get props => [buddys];
  final List<Buddy> buddys;

  BuddysLoaded(this.buddys) : super([buddys]);
}
