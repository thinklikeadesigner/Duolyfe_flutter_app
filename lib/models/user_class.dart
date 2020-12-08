class UserClass {
  final String uid;
  final DateTime creationTime;
  final DateTime lastSignInTime;

  UserClass({this.uid, this.creationTime, this.lastSignInTime});
}

class UserData {
  final List<dynamic> interests;
  final int time;
  final String buddy;
  final String uid;

  UserData({this.interests, this.uid, this.time, this.buddy});
}
