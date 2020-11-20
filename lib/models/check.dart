import 'package:flutter/material.dart';
import 'package:navigationapp/app.dart';

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
      {"category_id": "5", "category_name": "Barber"},
      {"category_id": "3", "category_name": "Carpanter"},
      {"category_id": "7", "category_name": "Cook"}
    ],
    "responseTotalResult":
        3 // Total result is 3 here becasue we have 3 categories in responseBody.
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
