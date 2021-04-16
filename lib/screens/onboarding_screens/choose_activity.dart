import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/buddy/buddy_bloc/bloc.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
import 'package:uic/step_indicator.dart';

import '../../theme.dart';

class ChooseActivity extends StatefulWidget {
  @override
  _ChooseActivityState createState() => _ChooseActivityState();
}

class _ChooseActivityState extends State<ChooseActivity> {
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

  // String _currentBuddy;
  // bool _completedOnboarding;
  List<String> _nextWidgetArguments = List<String>(2);
  List _currentInterests = List();
  final Map<String, dynamic> interests = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"interest_name": "Cooking"},
      {"interest_name": "Outdoors"},
      {"interest_name": "Mindfulness"},
      {"interest_name": "Sports"},
      {"interest_name": "Entertainment"},
      {"interest_name": "Crafts"},
      {"interest_name": "Nature"},
      {"interest_name": "Social"},
      {"interest_name": "Art"},
      {"interest_name": "Pampering"},
      {"interest_name": "Learning"},
      {"interest": "11", "interest_name": "Writing"}
    ],
    "responseTotalResult":
        12 // Total result is 3 here becasue we have 3 categories in responseBody.
  };

  void _onCategorySelected(bool selected, interest) {
    if (selected == true) {
      setState(() {
        _currentInterests.add(interest);
      });
    } else {
      setState(() {
        _currentInterests.remove(interest);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  @override
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
                            margin: const EdgeInsets.fromLTRB(20, 48, 20, 20),
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
                    child: Scrollbar(
                        isAlwaysShown: true,
                        controller: _scrollController,
                        child: ListView.builder(
                            controller: _scrollController,
                            itemCount: interests['responseTotalResult'],
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                value: _currentInterests.contains(
                                    interests['responseBody'][index]
                                        ['interest_name']),
                                onChanged: (bool selected) {
                                  _onCategorySelected(
                                      selected,
                                      interests['responseBody'][index]
                                          ['interest_name']);
                                  // print(_currentInterests);
                                },
                                title: Text(interests['responseBody'][index]
                                        ['interest_name'] ??
                                    'hi'),
                              );
                            }))),
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
                          onPressed: _currentInterests.length < 3
                              ? null
                              : () async {
                                  // print(_currentInterests);
                                  print('hamster.png');
                                  // await DatabaseService(uid: user.uid)
                                  //     .updateOnboarding(
                                  //         _currentInterests ??
                                  //             userData.interests,
                                  //         _completedOnboarding ??
                                  //             userData.completedOnboarding,
                                  //         _currentBuddy ?? userData.buddy);
                                  Navigator.of(context).pushNamed(
                                    '/chooseworktime',
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

// Expanded(
//     child: Scrollbar(
//         isAlwaysShown: true,
//         controller: _scrollController,
//         child: ListView.builder(
//             controller: _scrollController,
//             itemCount: _items.length,
//             itemBuilder: (context, index) {
//               return CheckboxListTile(
//                 value: _items.contains(
//                     _items[index]["category"]),
//                 onChanged: (bool selected) {
//                   _onCategorySelected(
//                       selected,
//                    _items[index]["category"]);
//                   // print(_currentInterests);
//                 },
//                 title: Text(_items[index]["category"] ??
//                     'hi'),
//               );
//             }
//             ),
//             ),
//             ),
