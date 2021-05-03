part of 'navbar_bloc.dart';



abstract class NavBarState extends Equatable {
  const NavBarState();
  
  @override
  List<Object> get props => [];
}

// class NavBarInitial extends NavBarState {}

class ShowBuddy extends NavBarState {
  final String title = "Buddy";
  final int itemIndex = 0;
}
class ShowSelfCare extends NavBarState {
  final String title = "Self-Care";
  final int itemIndex = 1;
}
class ShowSettings extends NavBarState {
  final String title = "Settings";
  final int itemIndex = 2;
}