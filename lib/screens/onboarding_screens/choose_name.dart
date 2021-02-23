import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';

import 'package:uic/widgets.dart';

import '../../app.dart';

class ChooseName extends StatelessWidget {
  final String imagePath;
  const ChooseName({Key key, this.imagePath}) : super(key: key);
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
              selectedStepIndex: 2,
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
            pickNameChatBubble(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 28),
              child: Column(
                children: [
                  FlatButton(
                      child: Text(
                        'Milo!',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: primaryTeal,
                      splashColor: primaryTeal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/milonamepicked', arguments: imagePath);
                      }),
                  FlatButton(
                      child: Text(
                        'Sky!',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: primaryTeal,
                      splashColor: primaryTeal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/skynamepicked', arguments: imagePath);
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 48, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                        child: Text('Skip'),
                        splashColor: primaryTeal,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black)),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/milonamepicked',
                              arguments: imagePath);
                        }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
