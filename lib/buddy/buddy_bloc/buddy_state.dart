import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import 'package:navigationapp/buddies/models/models.dart';
import 'package:navigationapp/buddy/models/models.dart';

@immutable
abstract class BuddyState extends Equatable {
  BuddyState([List props = const []]) : super();
}

class BuddiesLoading extends BuddyState {
  List<Object> get props => [];
}

//FIXME this is not needed, only one buddy can be chosen
//IDEA I need to figure out how to only pick one buddy at a time. maybe order by latest timestamp? idkkk
class BuddiesLoaded extends BuddyState {
  List<Object> get props => [buddies];
  final List<Buddy> buddies;

  BuddiesLoaded(this.buddies) : super([buddies]);
}

class BuddyLoaded extends BuddyState {
  List<Object> get props => [buddy];
  final Buddy buddy;

  BuddyLoaded(this.buddy) : super([buddy]);
}

class BuddiesDeleted extends BuddyState {
  List<Object> get props => [];
}