import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';

import 'package:navigationapp/services/database.dart';
import 'package:navigationapp/shared/loading.dart';
import 'package:navigationapp/widgets/check.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
// import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
// import 'package:navigationapp/widgets/buttons.dart';
// import 'package:navigationapp/widgets/chat_bubbles.dart';
// import 'package:preview/preview.dart';
import 'package:navigationapp/app.dart';
// import 'package:uic/step_indicator.dart';
import 'package:provider/provider.dart';

class ChooseActivity extends StatefulWidget {
  @override
  _ChooseActivityState createState() => _ChooseActivityState();
}

class _ChooseActivityState extends State<ChooseActivity> {
  List _currentInterests = List();
  final Map<String, dynamic> interests = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"interest_name": "Cooking"},
      {"interest_name": "Outdoors"},
      {"interest_name": "Mindfulness"},
      {"interest_name": "Sports"},
      {"interest_name": "Entertainment"},
      {"interest_name": "Crafts"},
      {"interest_name": "Nature"},
      {"interest_name": "Social"},
      {"interest_name": "Art"},
      {"interest_name": "Pampering"},
      {"interest_name": "Learning"},
      {"interest": "11", "interest_name": "Writing"}
    ],
    "responseTotalResult":
        12 // Total result is 3 here becasue we have 3 categories in responseBody.
  };

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

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserClass>(context);
    // return StreamBuilder<UserData>(
    //     stream: DatabaseService(uid: user.uid).userData,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         UserData userData = snapshot.data;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('hello'),
      // ),
      body: Column(
        children: <Widget>[
          Card(
            // elevation: 5.0,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 48, 20, 20),
                  child: Image(image: AssetImage("panda.png"), height: 120),
                ),
                pickActivityBubble(
                    ChatBubbleClipper2(type: BubbleType.receiverBubble),
                    context),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: interests['responseTotalResult'],
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    value: _currentInterests.contains(
                        interests['responseBody'][index]['interest_name']),
                    onChanged: (bool selected) {
                      _onCategorySelected(selected,
                          interests['responseBody'][index]['interest_name']);
                      print(_currentInterests);
                    },
                    title: Text(interests['responseBody'][index]
                            ['interest_name'] ??
                        'hi'),
                  );
                }),
          ),
        ],
      ),
      bottomSheet: Card(
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(width: 20),
            FlatButton(
                child: Text(
                  'Save Activities',
                  style: TextStyle(color: Colors.white),
                ),
                color: primaryTeal,
                splashColor: primaryTeal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () async {
                  // await DatabaseService(uid: user.uid)
                  //     .updateUserData(
                  //         _currentInterests ?? userData.interests,
                  //         5,
                  //         50,
                  //         "panda");
                  Navigator.of(context).pushNamed('/chooseworktime');
                }),
          ]),
        ),
        color: Colors.white,
      ),
    );

    // } else {
    //   return Loading();
    // }
    // });
  }
}
