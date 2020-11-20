import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/models/check.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
// import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
// import 'package:navigationapp/widgets/buttons.dart';
// import 'package:navigationapp/widgets/chat_bubbles.dart';
import 'package:preview/preview.dart';
import 'package:navigationapp/app.dart';
// import 'package:uic/step_indicator.dart';

class ChooseActivity extends StatefulWidget {
  @override
  _ChooseActivityState createState() => _ChooseActivityState();
}

class _ChooseActivityState extends State<ChooseActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('hello'),
      // ),
      body: Column(
        children: <Widget>[
          Card(
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
          Expanded(child: CheckTile()),
        ],
      ),
      bottomSheet: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FlatButton(
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.black),
                ),
                splashColor: primaryTeal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).pushNamed('/choosename');
                }),
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
                onPressed: () {
                  Navigator.of(context).pushNamed('/choosename');
                }),
          ]),
        ),
        color: Colors.white,
      ),
    );
  }
}
