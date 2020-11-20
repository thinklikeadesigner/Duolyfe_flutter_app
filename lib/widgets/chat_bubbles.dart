import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:navigationapp/app.dart';

firstChatBubble(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "Hi, I’m your Buddy! I’ll be guiding you through your account setup. We’ll start off with some Buddy customization, establishing some interests and concluded with your work schedule.",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

secondChatBubble(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "All of this will help me learn more about you so I can guide you via notifications and suggestions!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(widget.title),
//     ),
//     body: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: StepIndicator(
//         selectedStepIndex: 2,
//         totalSteps: 5,
//       ),
//     ),
//   );
// }

pickNameChatBubble(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "Woof! I’m so glad you picked me! Give me a name 😊",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

milo(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: purpleMessage,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "Milo.",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

imMilo(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "Hi! I'm Milo.",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

nextStep(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "Next step is to select your interests so I can suggest personalized activities after work!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

sky(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: purpleMessage,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "Sky.",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

imSky(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "Hi! I'm Sky.",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

pickActivityBubble(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 5),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.4,
        ),
        child: Text(
          " Your interests will help me decide what fun suggestions I should give every week!  ",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

customizeMe(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "On the next screen, please choose your new buddy!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
