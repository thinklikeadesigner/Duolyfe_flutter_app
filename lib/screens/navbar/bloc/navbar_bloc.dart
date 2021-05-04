import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:navigationapp/buddy/buddy_bloc/bloc.dart';
import 'package:navigationapp/screens/home/home.dart';
import 'package:navigationapp/screens/home/home_page.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
    int currentIndex = 0;
  NavBarBloc() : super(PageLoading());

  @override
  Stream<NavBarState> mapEventToState(NavBarEvent event) async* {
     if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }

    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
     
        yield HomePageLoaded();
      }
      if (this.currentIndex == 1) {
        
        yield TaskPageLoaded();
      }
       if (this.currentIndex == 2) {
        
        yield SettingsPageLoaded();
      }
    }
  }


}
