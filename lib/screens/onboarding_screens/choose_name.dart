import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/buddy/buddy_bloc/bloc.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';

import 'package:uic/widgets.dart';

import '../../theme.dart';

//MAKEME add name to buddybloc, state goes here
class ChooseName extends StatefulWidget {
  @override
  _ChooseNameState createState() => _ChooseNameState();
}

class _ChooseNameState extends State<ChooseName> {
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
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<BuddyBloc, BuddyState>(
      builder: (context, state) {
        if (state is BuddiesLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BuddiesLoaded) {
          final displayedBuddy = state.buddies[0];
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                  child: Image(
                      image: AssetImage(displayedBuddy.buddy), height: 150),
                ),
                StepIndicator(
                  selectedStepIndex: 2,
                  totalSteps: 6,
                  selectedStep: Icon(
                    Icons.radio_button_checked,
                    color: theme.accentColor,
                  ),
                  completedStep: Icon(
                    Icons.check_circle,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                pickNameChatBubble(
                    ChatBubbleClipper2(type: BubbleType.receiverBubble),
                    context),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 28),
                  child: Column(
                    children: [
                      TextButton(
                          child: Text(
                            'Milo!',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            // fixedSize: Size(120, 10),
                            primary: Colors.black,
                            backgroundColor: primaryTeal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/milonamepicked');
                          }),
                      TextButton(
                          child: Text(
                            'Sky!',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            // fixedSize: Size(120, 10),
                            primary: Colors.black,
                            backgroundColor: primaryTeal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/skynamepicked');
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 48, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: TextButton.styleFrom(
                          // fixedSize: Size(120, 10),
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          // Navigator.of(context).pushNamed('/milonamepicked',
                          //     );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Center();
      },
    );
  }
}
