class UserClass {
  final String uid;
  final DateTime creationTime;
  final DateTime lastSignInTime;

  UserClass({this.uid, this.creationTime, this.lastSignInTime});
}

class UserData {
  final String uid;
  final List<dynamic> interests;
  final bool completedOnboarding;
  final String buddy;

  UserData({this.uid, this.interests, this.completedOnboarding, this.buddy});
}
