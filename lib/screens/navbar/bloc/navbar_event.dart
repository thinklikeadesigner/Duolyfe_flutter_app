part of 'navbar_bloc.dart';


// enum NavBarItems { Buddy, SelfCare, Settings }

abstract class NavBarEvent extends Equatable {
  NavBarEvent([List props = const []]) : super();

  
}

// class NavigationLoading extends NavBarEvent {
//   @override
//   List<Object> get props => [];
// }

// class BuddyNavigated extends NavBarEvent {s
//   @override
//   List<Object> get props => [];
// }


// class SelfCareNavigated extends NavBarEvent {
//   @override
//   List<Object> get props => [];
// }

// class SettingsNavigated extends NavBarEvent {
//   @override
//   List<Object> get props => [];
// }


// // enum NavBarItem {
// //   Buddy, SelfCare, Settings
// // }




class AppStarted extends NavBarEvent {
  @override
  String toString() => 'AppStarted';

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PageTapped extends NavBarEvent {
  final int index;

  // PageTapped(this.index);
 List<Object> get props => [index];
  PageTapped({@required this.index}) : super([index]);


}

