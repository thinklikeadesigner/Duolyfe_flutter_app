import 'package:flutter/material.dart';

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
      {"categoryId": "1", "category_name": "cook a meal"},
      {"categoryId": "2", "category_name": "go for a hike"},
      {"categoryId": "3", "category_name": "meditate"},
      {"categoryId": "4", "category_name": "go to a movie"},
      {"categoryId": "5", "category_name": "call a friend"},
      {"categoryId": "6", "category_name": "read a book"},
      {"categoryId": "7", "category_name": "write in your journal"},
      {"categoryId": "8", "category_name": "set intentions"},
      {"categoryId": "9", "category_name": "walk through the trees"},
      {"categoryId": "10", "category_name": "take a calming bubble bath"},
      {"categoryId": "11", "category_name": "sit by the fire"},
      {"categoryId": "12", "category_name": "make a hot drink"}
    ],
    "responseTotalResult":
        12 // Total result is 3 here becasue we have 3 categories in responseBody.
  };

  void _onCategorySelected(bool selected, categoryId) {
    if (selected == true) {
      setState(() {
        _selecteCategorys.add(categoryId);
      });
    } else {
      setState(() {
        _selecteCategorys.remove(categoryId);
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
                  .contains(_categories['responseBody'][index]['categoryId']),
              onChanged: (bool selected) {
                _onCategorySelected(
                    selected, _categories['responseBody'][index]['categoryId']);
              },
              title: Text(_categories['responseBody'][index]['category_name']),
            );
          }),
    );
  }
}
