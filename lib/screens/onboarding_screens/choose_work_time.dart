import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:navigationapp/models/user_class.dart';
import 'package:navigationapp/services/database.dart';
import 'package:navigationapp/shared/loading.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';
import 'package:uic/step_indicator.dart';
import '../../app.dart';
import 'package:provider/provider.dart';

//TODO https://github.com/flutter/flutter/issues/24278 for ios alarm manager implementation

class ChooseWorkTime extends StatefulWidget {
  @override
  _ChooseWorkTimeState createState() => _ChooseWorkTimeState();
}

class _ChooseWorkTimeState extends State<ChooseWorkTime> {
  String _currentBuddy;
  dynamic _currentInterests;
  int _currentTime;
  TimeOfDay _time = TimeOfDay(hour: 17, minute: 0);
  TimeOfDay picked;

  Future<Null> selectTime(BuildContext context) async {
    _time = await showTimePicker(
      context: context,
      initialTime: _time,
    );

//TODO update chosen time to database
//TODO change int to timeofday after db figured out

    if (picked != null && picked != _time) {
      setState(() {});
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          if (snapshot.hasData) {
            return Scaffold(
              body: Center(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                      child: Image(image: AssetImage("panda.png"), height: 150),
                    ),
                    StepIndicator(
                      selectedStepIndex: 1,
                      totalSteps: 4,
                      selectedStep: Icon(
                        Icons.radio_button_checked,
                        color: Theme.of(context).accentColor,
                      ),
                      completedStep: Icon(
                        Icons.check_circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      incompleteStep: Icon(
                        Icons.radio_button_unchecked,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    ilovehiking(
                        ChatBubbleClipper2(type: BubbleType.receiverBubble),
                        context),
                    picktime(
                        ChatBubbleClipper2(type: BubbleType.receiverBubble),
                        context),

                    // SizedBox(
                    //   height: 30,
                    // ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // OnboardingLetsDoItButton(),
                          // OnboardingLetsDoItButton(),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(16, 10, 16, 28),
                        child: Column(
                          children: [
                            FlatButton(
                                child: Text(
                                  'Pick Time',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: primaryTeal,
                                splashColor: primaryTeal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                onPressed: () {
                                  selectTime(context);
                                  print(_time);
                                  // Navigator.of(context).pushNamed('/');
                                }),
                            FlatButton(
                                child: Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: primaryTeal,
                                splashColor: primaryTeal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                onPressed: () async {
                                  await DatabaseService(uid: user.uid)
                                      .updateOnboarding(
                                          _currentInterests ??
                                              userData.interests,
                                          _currentTime ?? userData.time,
                                          _currentBuddy ?? userData.buddy);
                                  _showMyDialog();

                                  // Navigator.of(context).pushNamed('/');
                                }),
                          ],
                        ))
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}

// IconButton(
//         icon: Icon(Icons.alarm),
//         onPressed: () {
//           selectTime(context);
//           print(_time);
//         },
//       ),
