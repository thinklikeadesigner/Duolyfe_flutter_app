import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter/painting.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
import 'package:uic/widgets.dart';
import '../../theme.dart';

class OnboardingStart extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => OnboardingStart());
  }
  // final AuthService _auth = AuthService();
  // final GmailAuthService _authGmail = GmailAuthService();

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserClass>(context);
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
            firstChatBubble(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            secondChatBubble(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            customizeMe(
                ChatBubbleClipper2(type: BubbleType.receiverBubble), context),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //PENDING flatbutton to textbutton
                  FlatButton(
                      child: Text('Skip'),
                      splashColor: primaryTeal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/navbar');
                      }),
                  //PENDING flatbutton to textbutton
                  FlatButton(
                    child: Text(
                      'Let\'s do it!',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: primaryTeal,
                    splashColor: primaryTeal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () async {
                      // await
                      // DatabaseService(uid: user.uid).updateOnboarding(
                      //     ['Crafts', 'Social'], false, 'panda');
                      Navigator.of(context).pushNamed('/choosebuddy');
                    },
                  ),
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
