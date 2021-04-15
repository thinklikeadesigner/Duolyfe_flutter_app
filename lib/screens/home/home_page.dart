import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import '../onboarding_screens/onboarding_screens.dart';
import 'package:navigationapp/services/shuffler.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
import '../../theme.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textHolder1 = '';
  String textHolder2 = '';
  String textHolder3 = '';
  bool suggested = false;

  // final AuthService _auth = AuthService();
  // final GmailAuthService _authGmail = GmailAuthService();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    OnboardingStart(),
    ChooseBuddy(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _items = [];

  // Fetch content from the json file
  Future readJson() async {
    final String response =
        await rootBundle.loadString('assets/activities.json');
    final map = await json.decode(response);

    return map["suggestions"];
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

    // final user = Provider.of<UserClass>(context);
    // return StreamBuilder<UserData>(
    //     stream: DatabaseService(uid: user.uid).userData,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         UserData userData = snapshot.data;
    //         print(userData.interests[0]);
    //         print(readJson().then((value) => print(value)));
    //         print(_items.runtimeType);
    //         _items.forEach((element) {
    //           print(element);
    //         });

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
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
                    height: 20,
                  ),
                ],
              ),
            ),
            !suggested
                ? SizedBox(height: 0.0)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          child: Text(
                            textHolder1,
                            style: TextStyle(color: Colors.black),
                          ),
                          style: TextButton.styleFrom(
                            fixedSize: Size(100, 10),
                            primary: Colors.black,
                            backgroundColor: primaryTeal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/chooseworktime');
                          }),
                      TextButton(
                          child: Text(
                            textHolder2,
                            style: TextStyle(color: Colors.black),
                          ),
                          style: TextButton.styleFrom(
                            fixedSize: Size(100, 10),
                            primary: Colors.black,
                            backgroundColor: primaryTeal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          onPressed: () {}),
                      TextButton(
                          child: Text(
                            textHolder3,
                            style: TextStyle(color: Colors.black),
                          ),
                          style: TextButton.styleFrom(
                            fixedSize: Size(100, 10),
                            primary: Colors.black,
                            backgroundColor: primaryTeal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          onPressed: () {}),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
  // else {
  //   return Loading();
}
