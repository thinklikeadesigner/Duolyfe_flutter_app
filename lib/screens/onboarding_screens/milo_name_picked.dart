import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';

import 'package:uic/widgets.dart';

import '../../app.dart';

class MiloNamePicked extends StatelessWidget {
  final String imagePath;
  const MiloNamePicked({Key key, this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Image(image: AssetImage(imagePath), height: 150),
            ),
            StepIndicator(
              selectedStepIndex: 3,
              totalSteps: 6,
              selectedStep: Icon(
                Icons.radio_button_checked,
                color: Theme.of(context).accentColor,
              ),
              completedStep: Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
              ),
            ),
            imMilo(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            nextStep(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                      child: Text(
                        'Save Buddy',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: primaryTeal,
                      splashColor: primaryTeal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/chooseactivity', arguments: imagePath);
                      }),
                ],
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
