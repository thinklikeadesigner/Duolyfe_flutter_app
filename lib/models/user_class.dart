import 'package:flutter/material.dart';

class UserClass {
  final String uid;
  final DateTime creationTime;
  final DateTime lastSignInTime;

  UserClass({this.uid, this.creationTime, this.lastSignInTime});
}

//TODO change int to timeofday after db figured out
class UserData {
  final String uid;
  final List<dynamic> interests;
  final int time;
  final String buddy;

  UserData({this.uid, this.interests, this.time, this.buddy});
}
