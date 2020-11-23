import 'package:flutter/material.dart';
import 'package:navigationapp/widgets/buttons.dart';
import 'package:preview/preview.dart';
import 'package:uic/step_indicator.dart';

class ChooseBuddy extends StatelessWidget with Previewer {
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
              margin: const EdgeInsets.fromLTRB(20, 48, 20, 20),
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
            Text('choose a buddy'),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [OnboardingSkipButton()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
