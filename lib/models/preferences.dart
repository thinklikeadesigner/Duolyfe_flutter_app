class Preferences {
  final List<Interest> interests;
  final int time;
  final int points;

  Preferences({this.interests, this.time, this.points});
}

class Interest {
  final String interest;
  Interest(this.interest);
}
