import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/buddy/buddy_bloc/bloc.dart';

import '../../theme.dart';

class ChooseBuddy extends StatefulWidget {
  @override
  _ChooseBuddyState createState() => _ChooseBuddyState();
}

//SPECS completed activity activity 5 points added to buddy health
//SPECS buddy health bar goes up
//SPECS  ACTIVITY UNCHECKED, BUDDY HEALTH DECREASES BY 5
//SPECS  FOR EVERY TASK OVER 100 POINTS, ONE TREAT

class _ChooseBuddyState extends State<ChooseBuddy> {
  String _currentBuddy;
  // dynamic _currentInterests;
  // int _completedOnboarding;

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
    // final ScrollController _scrollController = ScrollController();
    //  final ScrollController   _scrollController = ScrollController(initialScrollOffset: 50.0);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Scrollbar(
            isAlwaysShown: true,
            radius: Radius.circular(50),
            thickness: 5,
            // controller: _scrollController,
            //REFACTOR make card grid get data from array
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: buddyList['buddies'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        _currentBuddy = buddyList['buddies'][index];
                        print('current buddy $_currentBuddy');
                      },
                      child: Container(
                        height: 20,
                        child: Center(
                          child: Image(
                              image: AssetImage(buddyList['buddies'][index]),
                              height: 150),
                        ),
                      ),
                    ),
                    color: Colors.white,
                  );
                }),
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
                        print(_currentBuddy);
                        _buddyBloc.add(AddBuddy(_currentBuddy));
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

final Map<String, dynamic> buddyList = {
  "buddies": [
    "bear.png",
    "brownDog.png",
    "cat.png",
    "chick.png",
    "cow.png",
    "deer.png",
    "yellowDog.png",
    "fox.png",
    "giraffe.png",
    "hamster.png",
    "koala.png",
    "mouse.png",
    "panda.png",
    "pig.png",
    "racoon.png",
    "sheep.png",
    "tiger.png",
    "wolf.png"
  ]
};
