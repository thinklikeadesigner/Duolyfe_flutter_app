import 'package:flutter/material.dart';
// import 'package:flutter_chat_bubble/bubble_type.dart';
// import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
// import 'package:navigationapp/widgets/buttons.dart';
// import 'package:navigationapp/widgets/chat_bubbles.dart';

import 'package:navigationapp/app.dart';
import 'package:navigationapp/services/auth.dart';
// import 'package:uic/step_indicator.dart';

class ChooseBuddy extends StatefulWidget {
  @override
  _ChooseBuddyState createState() => _ChooseBuddyState();
}

String _currentBuddy;

class _ChooseBuddyState extends State<ChooseBuddy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: GridView(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 70),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            children: [
              GestureDetector(
                child: Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "panda";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child:
                            Image(image: AssetImage("panda.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "bear";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("bear.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "cat";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("cat.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "chick";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("chick.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "cow";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("cow.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "deer";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("deer.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "yellowDog";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(
                          image: AssetImage("yellowDog.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "fox";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("fox.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "giraffe";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child:
                          Image(image: AssetImage("giraffe.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "hamster";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child:
                          Image(image: AssetImage("hamster.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "koala";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("koala.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "mouse";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("mouse.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "pig";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("pig.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "brownDog";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child:
                          Image(image: AssetImage("brownDog.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "racoon";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child:
                          Image(image: AssetImage("racoon.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "sheep";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("sheep.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "tiger";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("tiger.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    _currentBuddy = "wolf";
                    print(_currentBuddy);
                  },
                  child: Container(
                    child: Center(
                      child: Image(image: AssetImage("wolf.png"), height: 150),
                    ),
                  ),
                ),
                color: Colors.white,
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        'Save Buddy',
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
      ),
    );
  }
}
