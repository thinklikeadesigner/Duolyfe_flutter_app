import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/app.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';

class CheckTile extends StatefulWidget {
  CheckTile({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CheckTileState createState() => new _CheckTileState();
}

class _CheckTileState extends State<CheckTile> {
  List _selecteCategorys = List();

  Map<String, dynamic> _categories = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "1", "category_name": "cook a meal"},
      {"category_id": "2", "category_name": "go for a hike"},
      {"category_id": "3", "category_name": "meditate"},
      {"category_id": "4", "category_name": "go to a movie"},
      {"category_id": "5", "category_name": "call a friend"},
      {"category_id": "6", "category_name": "read a book"},
      {"category_id": "7", "category_name": "write in your journal"},
      {"category_id": "8", "category_name": "set intentions"},
      {"category_id": "9", "category_name": "walk through the trees"},
      {"category_id": "10", "category_name": "take a calming bubble bath"},
      {"category_id": "11", "category_name": "sit by the fire"},
      {"category_id": "12", "category_name": "make a hot drink"}
    ],
    "responseTotalResult":
        12 // Total result is 3 here becasue we have 3 categories in responseBody.
  };

  void _onCategorySelected(bool selected, category_id) {
    if (selected == true) {
      setState(() {
        _selecteCategorys.add(category_id);
      });
    } else {
      setState(() {
        _selecteCategorys.remove(category_id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
          itemCount: _categories['responseTotalResult'],
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              value: _selecteCategorys
                  .contains(_categories['responseBody'][index]['category_id']),
              onChanged: (bool selected) {
                _onCategorySelected(selected,
                    _categories['responseBody'][index]['category_id']);
              },
              title: Text(_categories['responseBody'][index]['category_name']),
            );
          }),
    );
  }
}
