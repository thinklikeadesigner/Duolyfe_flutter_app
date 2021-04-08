import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class CategoryDetail extends StatefulWidget {
  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  List _currentInterests = List();

  void _onCategorySelected(bool selected, interest) {
    if (selected == true) {
      setState(() {
        _currentInterests.add(interest);
      });
    } else {
      setState(() {
        _currentInterests.remove(interest);
      });
    }
  }

  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/activities.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["suggestions"];
    });
  }

  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Kindacode.com',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Load Data'),
              onPressed: readJson,
            ),

            // Display the data loaded from sample.json
            _items.length > 0
                ? Expanded(
                    child: Scrollbar(
                      isAlwaysShown: true,
                      controller: _scrollController,
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: _items.length,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              value: _items.contains(_items[index]["category"]),
                              onChanged: (bool selected) {
                                _onCategorySelected(
                                    selected, _items[index]["category"]);
                                print(_currentInterests);
                              },
                              title: Text(_items[index]["category"] ?? 'hi'),
                            );
                          }),
                    ),
                  )
                // ? Expanded(
                //     child: ListView.builder(
                //       itemCount: _items.length,
                //       itemBuilder: (context, index) {
                //         return Card(
                //           margin: EdgeInsets.all(10),
                //           child: ListTile(
                //             leading: Text(_items[index]["category"]),

                //           ),
                //         );
                //       },
                //     ),
                //   )
                : Container()
          ],
        ),
      ),
    );
  }
}
