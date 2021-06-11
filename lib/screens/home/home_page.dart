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
import '../../tasks/task_bloc/bloc.dart';
import '../../tasks/models/task.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuddyBloc _buddyBloc;
  TaskBloc _taskBloc;

  @override
  void initState() {
    super.initState();
    _taskBloc = BlocProvider.of<TaskBloc>(context);
    // Obtaining the BuddyBloc instance through BlocProvider which is an InheritedWidget
    _buddyBloc = BlocProvider.of<BuddyBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading buddies right from the start.
    _buddyBloc.add(LoadBuddies());
    _taskBloc.add(LoadTasks());
  }

  bool suggested = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
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
                                      _taskBloc.add(SuggestTasks());
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
                      : Container(
                          child: _buildList(),
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

  Widget _buildList() {
    return Container(
      width: 282,
      child: BlocBuilder<TaskBloc, TaskState>(
        // Whenever there is a new state emitted from the bloc, builder runs.
        builder: (BuildContext context, TaskState state) {
          if (state is TasksLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TaskDisplayed) {
            //BUG random task shows multiple at once
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final displayedTask = state.tasks[index];

                  return TextButton(
                      child: Text(
                        displayedTask.activity,
                        style: TextStyle(color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        // fixedSize: Size(100, 10),
                        primary: Colors.black,
                        backgroundColor: primaryTeal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      onPressed: () {
                        _taskBloc.add(AddChosenTask(displayedTask));
                      });
                });
          }
          return Center();
        },
      ),
    );
  }
}
