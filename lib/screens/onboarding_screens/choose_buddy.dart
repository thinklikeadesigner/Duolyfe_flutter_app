import 'package:flutter/material.dart';
// import 'package:flutter_chat_bubble/bubble_type.dart';
// import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
// import 'package:navigationapp/widgets/buttons.dart';
// import 'package:navigationapp/widgets/chat_bubbles.dart';

import 'package:navigationapp/app.dart';
import 'package:navigationapp/services/auth.dart';
// import 'package:uic/step_indicator.dart';

class ChooseBuddy extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Brew Crew'),
      //   backgroundColor: Colors.brown[400],
      //   elevation: 0.0,
      //   actions: <Widget>[
      //     FlatButton.icon(
      //       icon: Icon(Icons.person),
      //       label: Text('logout'),
      //       onPressed: () async {
      //         print('signing out');
      //         await _auth.signOut();
      //       },
      //     ),
      //   ],
      // ),
      body: Container(
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: [
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
                  ),
                ),
              ),
              color: Colors.white,
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  child: Center(
                    child: Image(image: AssetImage("panda.png"), height: 150),
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
    );
  }
}
