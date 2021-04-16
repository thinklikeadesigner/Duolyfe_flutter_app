import 'package:meta/meta.dart';

class Buddy {
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Buddy.
  int id;

  final String buddy;
  bool selected;

  Buddy({@required this.buddy, @required this.selected});

  Map<String, dynamic> toMap() {
    return {
      'buddy': buddy,
      'selected': selected,
    };
  }

  static Buddy fromMap(Map<String, dynamic> map) {
    return Buddy(
      buddy: map['buddy'],
      selected: map['selected'],
    );
  }
}
