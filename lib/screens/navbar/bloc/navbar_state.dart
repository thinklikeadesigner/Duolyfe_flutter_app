part of 'navbar_bloc.dart';

abstract class NavBarState extends Equatable {}

class ShowBuddy extends NavBarState {
  final int itemIndex;

  ShowBuddy(this.itemIndex);

  @override
  // TODO: implement props
  List<Object> get props => [itemIndex];
}

class ShowSelfCare extends NavBarState {
  final int itemIndex;

  ShowSelfCare(this.itemIndex);

  @override
  // TODO: implement props
  List<Object> get props => [itemIndex];
}

class ShowSettings extends NavBarState {
  final int itemIndex;

  ShowSettings(this.itemIndex);

  @override
  // TODO: implement props
  List<Object> get props => [itemIndex];
}

class CurrentIndexChanged extends NavBarState {
  final int currentIndex;

  CurrentIndexChanged({@required this.currentIndex}) : super();

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';

  @override
  // TODO: implement props
  List<Object> get props => [currentIndex];
}

class PageLoading extends NavBarState {
  @override
  String toString() => 'PageLoading';

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomePageLoaded extends NavBarState {
  
  

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TaskPageLoaded extends NavBarState {
  
  

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SettingsPageLoaded extends NavBarState {
  
  
  @override
  // TODO: implement props
  List<Object> get props => [];
}
