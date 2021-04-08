import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:navigationapp/app.dart';

import '../theme.dart';

// ONBOARDING START SCREEN
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

// CHOOSE NAME SCREEN

pickNameChatBubble(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "I’m so glad you picked me! Give me a name 😊",
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

// CHOOSE ACTIVITY SCREEN
pickActivityBubble(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 5),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.4,
        ),
        child: Text(
          " Your interests will help me decide what fun suggestions I should give every week! Pick at least 3 ",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

//CHOOSE WORK TIME SCREEN
ilovehiking(CustomClipper clipper, BuildContext context, String interest) =>
    ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 5),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.4,
        ),
        child: Text(
          " I also love $interest! We will make a great team! ",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

picktime(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 5),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.4,
        ),
        child: Text(
          "Now let’s create your work schedule so we can follow it together. Select the start and end times for your work day below. ",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
picksomethingtodo(CustomClipper clipper, BuildContext context) => ChatBubble(
      clipper: clipper,
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          "It’s been a few days without outdoor fun. Here are some fun things to do today!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );

//CHOOSE LUNCH TIME SCREEN
