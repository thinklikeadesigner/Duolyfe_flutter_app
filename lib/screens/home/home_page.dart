import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:navigationapp/buddy/buddy_bloc/bloc.dart';
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

  String textHolder1 = '';
  String textHolder2 = '';
  String textHolder3 = '';
  bool suggested = false;



//FUTURE not reading from file
  // Future readJson() async {
  //   final String response = await rootBundle.loadString('assets/tasks.json');
  //   final map = await json.decode(response);

  //   return map["suggestions"];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
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

    return BlocBuilder<BuddyBloc, BuddyState>(builder: (context, state) {
      if (state is BuddiesLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is BuddiesLoaded) {
        final displayBuddy = state.buddies[0];
        return BlocBuilder<BuddyBloc, BuddyState>(builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Image(image: AssetImage(displayBuddy.buddy), height: 130),
                  //MAKEME should get name from buddybloc
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
                                    margin:
                                        EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
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
                                  onTap: () {
//NOTE health logic bloc goes here
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
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
                                  onTap: () {
                                    //MAKEME redirects to buddy page
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
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
                                  fixedSize: Size(300, 10),
                                  primary: Colors.black,
                                  backgroundColor: primaryTeal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                onPressed: () {

                                }),
                            TextButton(
                                child: Text(
                                  textHolder2,
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: TextButton.styleFrom(
                                  fixedSize: Size(300, 10),
                                  primary: Colors.black,
                                  backgroundColor: primaryTeal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                onPressed: () {
                                  
                                }),
                            TextButton(
                                child: Text(
                                  textHolder3,
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: TextButton.styleFrom(
                                  fixedSize: Size(300, 10),
                                  primary: Colors.black,
                                  backgroundColor: primaryTeal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                onPressed: () {
                                  
                                }),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                ],
              ),
            ),
          );
        });
      }
      return Center();
    });
  }
}
