import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/widgets/buttons.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
import 'package:preview/preview.dart';
import 'package:uic/widgets.dart';
import 'package:navigationapp/app.dart';

class SkyNamePicked extends StatelessWidget with Previewer {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('hello'),
      // ),
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Image(image: AssetImage("panda.png"), height: 150),
            ),
            StepIndicator(
              selectedStepIndex: 1,
              totalSteps: 4,
              selectedStep: Icon(
                Icons.radio_button_checked,
                color: Theme.of(context).accentColor,
              ),
              completedStep: Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
              ),
              incompleteStep: Icon(
                Icons.radio_button_unchecked,
                color: Theme.of(context).primaryColor,
              ),
            ),

            pickNameChatBubble(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            sky(ChatBubbleClipper2(type: BubbleType.sendBubble), context),
            imSky(ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            nextStep(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            // SizedBox(
            //   height: 30,
            // ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                      child: Text('Skip'),
                      splashColor: primaryTeal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/choosename');
                      }),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 28),
              child: PickActivities(),
            )
          ],
        ),
      ),
    );
  }
}
