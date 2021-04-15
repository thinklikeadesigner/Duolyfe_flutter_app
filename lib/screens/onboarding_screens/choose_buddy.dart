import 'package:flutter/material.dart';
import 'package:navigationapp/app.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/services/database.dart';
import 'package:navigationapp/shared/loading.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class ChooseBuddy extends StatefulWidget {
  @override
  _ChooseBuddyState createState() => _ChooseBuddyState();
}

class _ChooseBuddyState extends State<ChooseBuddy> {
  String _currentBuddy;
  dynamic _currentInterests;
  int _completedOnboarding;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context);
    final ScrollController _scrollController = ScrollController();
    // return
    // StreamBuilder<UserData>(
    //     stream: DatabaseService(uid: user.uid).userData,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         UserData userData = snapshot.data;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Scrollbar(
            isAlwaysShown: true,
            controller: _scrollController,
            //TODO build ui from buddy store
            child: GridView(
              controller: _scrollController,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 70),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              children: [
                GestureDetector(
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        _currentBuddy = "panda.png";
                        print(_currentBuddy);
                      },
                      child: Container(
                        child: Center(
                          child: Image(
                              image: AssetImage("panda.png"), height: 150),
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
                      _currentBuddy = "bear.png";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child:
                            Image(image: AssetImage("bear.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "cat.png";
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
                      _currentBuddy = "chick.png";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child:
                            Image(image: AssetImage("chick.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "cow.png";
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
                      _currentBuddy = "deer.png";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child:
                            Image(image: AssetImage("deer.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "yellowDog.png";
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
                      _currentBuddy = "fox.png";
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
                      _currentBuddy = "giraffe.png";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child: Image(
                            image: AssetImage("giraffe.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "hamster.png";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child: Image(
                            image: AssetImage("hamster.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "koala.png";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child:
                            Image(image: AssetImage("koala.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "mouse.png";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child:
                            Image(image: AssetImage("mouse.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "pig.png";
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
                      _currentBuddy = "brownDog.png";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child: Image(
                            image: AssetImage("brownDog.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "racoon.png";
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
                      _currentBuddy = "sheep.png";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child:
                            Image(image: AssetImage("sheep.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "tiger.png";
                      print(_currentBuddy);
                    },
                    child: Container(
                      child: Center(
                        child:
                            Image(image: AssetImage("tiger.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      _currentBuddy = "wolf.png";
                    },
                    child: Container(
                      child: Center(
                        child:
                            Image(image: AssetImage("wolf.png"), height: 150),
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        fixedSize: Size(120, 10),
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: BorderSide(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/chooseworktime');
                      }),
                  TextButton(
                      child: Text(
                        'Save Buddy',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        fixedSize: Size(120, 10),
                        primary: Colors.black,
                        backgroundColor: primaryTeal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      onPressed: () async {
                        // await DatabaseService(uid: user.uid)
                        //     .updateOnboarding(
                        //         _currentInterests ?? userData.interests,
                        //         _completedOnboarding ??
                        //             userData.completedOnboarding,
                        //         _currentBuddy ?? userData.buddy);
                        //if user presses save but doesn't choose a buddy, arguments: _currentBuddy) will be called on null, so I added a default argument
                        //TODO darken selected card
                        Navigator.of(context).pushNamed('/choosename',
                            arguments: _currentBuddy ?? 'panda.png');
                      }),
                ]),
          ),
          color: Colors.white,
        ),
      ),
    );
    //   } else {
    //     return Loading();
    //   }
    // });
  }
}
