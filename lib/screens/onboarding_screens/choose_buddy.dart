import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/buddy/buddy_bloc/bloc.dart';

import '../../theme.dart';

class ChooseBuddy extends StatefulWidget {
  @override
  _ChooseBuddyState createState() => _ChooseBuddyState();
}

class _ChooseBuddyState extends State<ChooseBuddy> {
  String _currentBuddy;
  dynamic _currentInterests;
  int _completedOnboarding;

  BuddyBloc _buddyBloc;

  @override
  void initState() {
    super.initState();
    // Obtaining the BuddyBloc instance through BlocProvider which is an InheritedWidget
    _buddyBloc = BlocProvider.of<BuddyBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading buddies right from the start.
    _buddyBloc.add(LoadBuddies());
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Scrollbar(
            isAlwaysShown: true,
            controller: _scrollController,
            //PENDING make card grid get data from array
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
