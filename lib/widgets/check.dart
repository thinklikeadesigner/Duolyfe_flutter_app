// import 'package:flutter/material.dart';

// class CheckTile extends StatefulWidget {
//   CheckTile({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _CheckTileState createState() => new _CheckTileState();
// }

// class _CheckTileState extends State<CheckTile> {
//   List _currentInterests = List();
//   final Map<String, dynamic> interests = {
//     "responseCode": "1",
//     "responseText": "List categories.",
//     "responseBody": [
//       {"interest": "0", "category_name": "Cooking"},
//       {"interest": "1", "category_name": "Outdoors"},
//       {"interest": "2", "category_name": "Mindfulness"},
//       {"interest": "3", "category_name": "Sports"},
//       {"interest": "4", "category_name": "Entertainment"},
//       {"interest": "5", "category_name": "Crafts"},
//       {"interest": "6", "category_name": "Nature"},
//       {"interest": "7", "category_name": "Social"},
//       {"interest": "8", "category_name": "Art"},
//       {"interest": "9", "category_name": "Pampering"},
//       {"interest": "10", "category_name": "Learning"},
//       {"interest": "11", "category_name": "Writing"}
//     ],
//     "responseTotalResult":
//         12 // Total result is 3 here becasue we have 3 categories in responseBody.
//   };

//   void _onCategorySelected(bool selected, interest) {
//     if (selected == true) {
//       setState(() {
//         _currentInterests.add(interest);
//       });
//     } else {
//       setState(() {
//         _currentInterests.remove(interest);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: ListView.builder(
//           itemCount: interests['responseTotalResult'],
//           itemBuilder: (BuildContext context, int index) {
//             return CheckboxListTile(
//               value: _currentInterests
//                   .contains(interests['responseBody'][index]['category_name']),
//               onChanged: (bool selected) {
//                 _onCategorySelected(selected,
//                     interests['responseBody'][index]['category_name']);
//                 print(_currentInterests);
//               },
//               title: Text(interests['responseBody'][index]['category_name']),
//             );
//           }),
//     );
//   }
// }
