part of 'navbar_bloc.dart';

abstract class NavBarEvent extends Equatable {
  const NavBarEvent();

  @override
  List<Object> get props => [];
}

class NavigationLoading extends NavBarEvent {
  @override
  List<Object> get props => [];
}

class BuddyNavigated extends NavBarEvent {
  @override
  List<Object> get props => [];
}


class SelfCareNavigated extends NavBarEvent {
  @override
  List<Object> get props => [];
}

class SettingsNavigated extends NavBarEvent {
  @override
  List<Object> get props => [];
}


// enum NavBarItem {
//   Buddy, SelfCare, Settings
// }

