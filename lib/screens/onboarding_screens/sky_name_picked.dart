import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/buddy/buddy_bloc/bloc.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
import 'package:uic/widgets.dart';
import '../../theme.dart';

//MAKEME single screen for name and use buddybloc to add name
class SkyNamePicked extends StatefulWidget {
  @override
  _SkyNamePickedState createState() => _SkyNamePickedState();
}

class _SkyNamePickedState extends State<SkyNamePicked> {
  BuddyBloc _buddyBloc;
  @override
  void initState() {
    super.initState();
    _buddyBloc = BlocProvider.of<BuddyBloc>(context);
    _buddyBloc.add(LoadBuddies());
  }

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
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                  child:
                      Image(image: AssetImage(displayBuddy.buddy  ?? "panda.png"), height: 150),
                ),
                StepIndicator(
                  selectedStepIndex: 3,
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
                pickNameChatBubble(
                    ChatBubbleClipper2(type: BubbleType.receiverBubble),
                    context),
                sky(ChatBubbleClipper2(type: BubbleType.sendBubble), context),
                imSky(ChatBubbleClipper2(type: BubbleType.receiverBubble),
                    context),
                nextStep(ChatBubbleClipper2(type: BubbleType.receiverBubble),
                    context),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //REFACTOR flatbutton to textbutton
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
                            Navigator.of(context).pushNamed('/chooseactivity');
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        );
      }
      return Center();
    });
  }
}
