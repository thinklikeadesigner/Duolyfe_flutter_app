class SelectedActivitiesAndBuddies {
  User user;

  SelectedActivitiesAndBuddies({this.user});

  SelectedActivitiesAndBuddies.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String firstName;
  String lastName;
  int accumulatedPoints;
  String offWork;
  SelectedBuddy selectedBuddy;
  SelectedActivities selectedActivities;

  User(
      {this.firstName,
      this.lastName,
      this.accumulatedPoints,
      this.offWork,
      this.selectedBuddy,
      this.selectedActivities});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    accumulatedPoints = json['accumulated_points'];
    offWork = json['off_work'];
    selectedBuddy = json['selected_buddy'] != null
        ? new SelectedBuddy.fromJson(json['selected_buddy'])
        : null;
    selectedActivities = json['selected_activities'] != null
        ? new SelectedActivities.fromJson(json['selected_activities'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['accumulated_points'] = this.accumulatedPoints;
    data['off_work'] = this.offWork;
    if (this.selectedBuddy != null) {
      data['selected_buddy'] = this.selectedBuddy.toJson();
    }
    if (this.selectedActivities != null) {
      data['selected_activities'] = this.selectedActivities.toJson();
    }
    return data;
  }
}

class SelectedBuddy {
  bool panda;
  bool sheep;
  bool fox;

  SelectedBuddy({this.panda, this.sheep, this.fox});

  SelectedBuddy.fromJson(Map<String, dynamic> json) {
    panda = json['panda'];
    sheep = json['sheep'];
    fox = json['fox'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['panda'] = this.panda;
    data['sheep'] = this.sheep;
    data['fox'] = this.fox;
    return data;
  }
}

class SelectedActivities {
  bool hiking;
  bool reading;
  bool cooking;
  bool dancing;
  bool gardening;
  bool meditating;

  SelectedActivities(
      {this.hiking,
      this.reading,
      this.cooking,
      this.dancing,
      this.gardening,
      this.meditating});

  SelectedActivities.fromJson(Map<String, dynamic> json) {
    hiking = json['hiking'];
    reading = json['reading'];
    cooking = json['cooking'];
    dancing = json['dancing'];
    gardening = json['gardening'];
    meditating = json['meditating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hiking'] = this.hiking;
    data['reading'] = this.reading;
    data['cooking'] = this.cooking;
    data['dancing'] = this.dancing;
    data['gardening'] = this.gardening;
    data['meditating'] = this.meditating;
    return data;
  }
}
