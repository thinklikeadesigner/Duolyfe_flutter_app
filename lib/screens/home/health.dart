import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:navigationapp/screens/authenticate/gmailsignin/gmail_signin.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:navigationapp/services/shuffler.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
import 'package:provider/provider.dart';
import '../../app.dart';

class Health extends StatefulWidget {
  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  String textHolder1 = '';
  String textHolder2 = '';
  String textHolder3 = '';
  bool suggested = false;

  final AuthService _auth = AuthService();
  final GmailAuthService _authGmail = GmailAuthService();
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // final List<Widget> _widgetOptions = <Widget>[
  //   Text('hi'),
  //   Text(
  //     'Index 1: Self-Care Screen',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Settings Screen',
  //     style: optionStyle,
  //   ),
  // ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      'rock climb',
      'drink tea',
      'bake a cake',
      'walk your dog',
      'meditate',
      'write in your journal',
      'read a book',
      'sing a song',
      'take a picture of a pretty landscape',
      'paint a picture',
      'go for a hike',
      'call an old friend',
      'get coffee with a relative'
    ];

    var shuffledItems = shuffle(items);

    return Scaffold(
      // backgroundColor: Colors.brown[100],
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
      body: Center(
        child: Column(
          children: [
            Image(image: AssetImage("giraffe.png"), height: 130),
            Text(
              'Milo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Buddy Health Avg',
              textAlign: TextAlign.end,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.mood_bad),
                SizedBox(width: 5),
                IntervalProgressBar(
                    direction: IntervalProgressDirection.horizontal,
                    max: 20,
                    progress: 10,
                    intervalSize: 2,
                    size: Size(200, 10),
                    highlightColor: Colors.grey,
                    defaultColor: primaryTeal,
                    intervalColor: Colors.transparent,
                    intervalHighlightColor: Colors.transparent,
                    reverse: true,
                    radius: 0),
                SizedBox(width: 5),
                Icon(Icons.mood),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Pick Something To Do',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              setState(() {
                                textHolder1 = shuffledItems[0];
                                textHolder2 = shuffledItems[1];
                                textHolder3 = shuffledItems[2];
                                suggested = true;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
                              child: Center(
                                child: Text(
                                  'Suggest Something Fun',
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
                              child: Center(
                                child: Text(
                                  'Give Milo A Treat',
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
                              child: Center(
                                child: Text(
                                  'Customize Your Buddy',
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  picksomethingtodo(
                      ChatBubbleClipper2(type: BubbleType.receiverBubble),
                      context),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            !suggested
                ? SizedBox(height: 0.0)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlatButton(
                          minWidth: 200,
                          child: Text(
                            textHolder1,
                            style: TextStyle(color: Colors.black),
                          ),
                          color: primaryTeal,
                          splashColor: primaryTeal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {}),
                      FlatButton(
                          minWidth: 200,
                          child: Text(
                            textHolder2,
                            style: TextStyle(color: Colors.black),
                          ),
                          color: Colors.white,
                          splashColor: primaryTeal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)),
                          onPressed: () {
                            // Navigator.of(context).pushNamed('/choosebuddy');
                          }),
                      FlatButton(
                          minWidth: 200,
                          child: Text(
                            textHolder3,
                            style: TextStyle(color: Colors.black),
                          ),
                          color: Colors.white,
                          splashColor: primaryTeal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)),
                          onPressed: () {
                            // Navigator.of(context).pushNamed('/choosebuddy');
                          }),
                    ],
                  ),
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                print('signing out');
                await _auth.signOut();
                await _authGmail.signOutGoogle();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Buddy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Self-Care',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

// GridView(
// padding: EdgeInsets.fromLTRB(10, 10, 10, 70),
//             gridDelegate:
// SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//             children: [
// Card(
//   child: InkWell(
//     splashColor: Colors.blue.withAlpha(30),
//     onTap: () {},
//     child: Container(
//       child: Center(
//         child: Image(image: AssetImage("fox.png"), height: 150),
//       ),
//     ),
//   ),
//   color: Colors.white,
// ),
//               Card(
//                 child: InkWell(
//                   splashColor: Colors.blue.withAlpha(30),
//                   onTap: () {},
//                   child: Container(
//                     child: Center(
//                       child:
// Image(image: AssetImage("giraffe.png"), height: 150),
//                     ),
//                   ),
//                 ),
//                 color: Colors.white,
//               ),
//               Card(
//                 child: InkWell(
//                   splashColor: Colors.blue.withAlpha(30),
//                   onTap: () {},
//                   child: Container(
//                     child: Center(
//                       child:
//                           Image(image: AssetImage("giraffe.png"), height: 150),
//                     ),
//                   ),
//                 ),
//                 color: Colors.white,
//               ),
//             ],
//           ),
//         ),

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('BottomNavigationBar Sample'),
//     ),
//     body: Center(
//       child: _widgetOptions.elementAt(_selectedIndex),
//     ),
//     bottomNavigationBar: BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.Health),
//           label: 'Health',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.business),
//           label: 'Business',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.school),
//           label: 'School',
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.amber[800],
//       onTap: _onItemTapped,
//     ),
//   );
// }
