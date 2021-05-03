import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarBloc() : super(ShowBuddy());

  @override
  Stream<NavBarState> mapEventToState(
    NavBarEvent event,
  ) async* {
    if (event is BuddyNavigated) {
      yield ShowBuddy();
    }
    if (event is SelfCareNavigated) {
      yield ShowSelfCare();
    }
    if (event is SettingsNavigated) {
      yield ShowSettings();
    }
  }
}
