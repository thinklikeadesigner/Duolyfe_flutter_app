import 'package:meta/meta.dart';

class Time {
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Time.
  int id;
  String time;

  Time({
    @required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'time': time,
    };
  }

  static Time fromMap(Map<String, dynamic> map) {
    return Time(
      time: map['time'],
    );
  }
}

// DateTime is not a supported type. Similarly to firestore, it should be stored as a Timestamp object.

// Timestamp can easily be convert toDateTime() and fromDateTime(dateTime).
