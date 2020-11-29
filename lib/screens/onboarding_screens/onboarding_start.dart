import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter/painting.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:navigationapp/widgets/buttons.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
import 'package:uic/widgets.dart';

class OnboardingStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(20, 24, 20, 20),
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
            firstChatBubble(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            secondChatBubble(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            customizeMe(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            // SizedBox(
            //   height: 30,
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  OnboardingSkipButton(),
                  OnboardingLetsDoItButton(),
                ],
              ),
            ),
            ClipRect(
              clipBehavior: Clip.antiAlias,
            )
          ],
        ),
      ),
    );
  }
}
