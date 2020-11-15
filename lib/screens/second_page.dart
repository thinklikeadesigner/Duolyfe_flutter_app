import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
import 'package:preview/preview.dart';
import 'package:uic/step_indicator.dart';

class SecondPage extends StatelessWidget with Previewer {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('hello'),
      // ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(image: AssetImage("panda.png"), height: 150),
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
            firstChatBubble(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            secondChatBubble(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
