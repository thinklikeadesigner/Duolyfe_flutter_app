import 'package:meta/meta.dart';

class Interest {
  // Id will be gotten from the database.
  // It's automatically generated & unique for every stored Buddy.
  int id;

  final String interest;
  bool selected;

  Interest({@required this.interest, @required this.selected});

  Map<String, dynamic> toMap() {
    return {
      'interest': interest,
      'selected': selected,
    };
  }

  static Interest fromMap(Map<String, dynamic> map) {
    return Interest(
      interest: map['interest'],
      selected: map['selected'],
    );
  }
}
