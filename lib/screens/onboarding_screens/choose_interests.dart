import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/activity/activity_bloc/bloc.dart';
import 'package:navigationapp/buddy/buddy_bloc/bloc.dart';
import 'package:navigationapp/services/read_tasks_file.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
import 'package:uic/step_indicator.dart';

import '../../theme.dart';

class ChooseInterests extends StatefulWidget {
  @override
  _ChooseInterestsState createState() => _ChooseInterestsState();
}

//NEED tasks bloc to add chosen event

class _ChooseInterestsState extends State<ChooseInterests> {
  BuddyBloc _buddyBloc;
  ActivityBloc _activityBloc;
  ReadTasksFile _readTasksFile =
      ReadTasksFile('assets/tasks.json', 'interests');

  @override
  void initState() {
    super.initState();
    // Obtaining the BuddyBloc instance through BlocProvider which is an InheritedWidget
    _buddyBloc = BlocProvider.of<BuddyBloc>(context);
    _activityBloc = BlocProvider.of<ActivityBloc>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading buddies right from the start.
    _buddyBloc.add(LoadBuddies());
    _activityBloc.add(LoadActivities());

    _readTasksFile.readJson().then((value) => print(value));
  }

  // String _currentBuddy;
  // bool _completedOnboarding;
  //DEAD not adding activity to chat bubble anymore
  //REFACTOR we can add activity to chat bubble later, not important
  // List<String> _nextWidgetArguments = List<String>(2);
  List _currentInterests = [];
  final Map<String, dynamic> interestList = {
    "interests": [
      "cooking",
      "fun",
      "health",
      "indoor",
      "mind",
      "outdoor",
      "personal development",
      "social"
    ]
  };

  void _onInterestSelected(bool selected, interest) {
    if (selected == true) {
      setState(() {
        //test check if added to activity store
        //COMPLETE yes it adds
        //QUESTION do we need this?
        _currentInterests.add(interest);
        _activityBloc.add(AddInterest(interest));
      });
    } else {
      setState(() {
        //test check if removed from activity store
        //COMPLETE yes it does
        ////QUESTION do we need this?
        _currentInterests.remove(interest);
        _activityBloc.add(RemoveInterest(interest));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final ScrollController _scrollController = ScrollController();
    return BlocBuilder<BuddyBloc, BuddyState>(builder: (context, state) {
      if (state is BuddiesLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is BuddiesLoaded) {
        final displayBuddy = state.buddies[0];
        return BlocBuilder<BuddyBloc, BuddyState>(builder: (context, state) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                            child: Image(
                                image: AssetImage(displayBuddy.buddy),
                                height: 120),
                          ),
                          pickActivityBubble(
                              ChatBubbleClipper2(
                                  type: BubbleType.receiverBubble),
                              context),
                        ],
                      ),
                      StepIndicator(
                        selectedStepIndex: 4,
                        totalSteps: 6,
                        selectedStep: Icon(
                          Icons.radio_button_checked,
                          color: Theme.of(context).accentColor,
                        ),
                        completedStep: Icon(
                          Icons.check_circle,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<ActivityBloc, ActivityState>(
                      builder: (context, state) {
                    if (state is ActivitiesLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Scrollbar(
                        child: ListView.builder(
                            controller: _scrollController,
                            itemCount: interestList['interests'].length,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                value: _currentInterests
                                    .contains(interestList['interests'][index]),
                                //NOTE this is interesting bc we are actually addin the interest with _onInterestSelected
                                onChanged: (bool selected) {
                                  _onInterestSelected(selected,
                                      interestList['interests'][index]);
                                },
                                title: Text(interestList['interests'][index] ??
                                    'where is the interest'),
                              );
                            }),
                      );
                    }
                  }),
                ),
              ],
            ),
            bottomSheet: Card(
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 20),
                      TextButton(
                          child: Text(
                            'Save Interests',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            onSurface: primaryTeal,
                            fixedSize: Size(100, 10),
                            primary: Colors.black,
                            backgroundColor: primaryTeal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          //GOOGLE disable save button
                          //FIXME save button not greyed out
                          //BUG " Unhandled Exception: Could not find a generator for route RouteSettings("/activitypage", null) in the _WidgetsAppState."
                          onPressed: _currentInterests.length < 3
                              ? null
                              : () async {
                                  Navigator.of(context).pushNamed(
                                    '/activitypage',
                                  );
                                }),
                    ]),
              ),
              color: Colors.white,
            ),
          );
        });
      }
      return Center();
    });
  }
}

// https://mightytechno.com/flutter-disable-enable-button/
