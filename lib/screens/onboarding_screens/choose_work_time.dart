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
import 'package:timezone/timezone.dart' as tz;

import '../../theme.dart';

class ChooseWorkTime extends StatefulWidget {
  List<String> arguments;
  // ChooseWorkTime(this.arguments) {
  //   this.arguments = arguments;
  // }

  @override
  _ChooseWorkTimeState createState() => _ChooseWorkTimeState();
}

class _ChooseWorkTimeState extends State<ChooseWorkTime> {
  String _currentBuddy;
  dynamic _currentInterests;
  bool _completedOnboarding;
  TimeOfDay _time;
  TimeOfDay picked;

  Future<Null> selectTime(BuildContext context) async {
    _time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 17, minute: 0),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                // change the border color
                primary: primaryTeal,
                // change the text color
              ),
              // button colors
              buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme.light(
                  primary: Colors.green,
                ),
              ),
            ),
            child: child,
          );
        });

    if (picked != null && picked != _time) {
      setState(() {
        // print(_convertTimeofDaytoDatetime(_time));
      });
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Onboarding complete!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('Onboarding complete!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve', style: TextStyle(color: primaryTeal)),
              onPressed: () {
                print(_completedOnboarding);
                // return Wrapper();
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
                      child: Image(image: AssetImage('panda.png'), height: 150),
                    ),
                    StepIndicator(
                      selectedStepIndex: 5,
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
                    ilovehiking(
                        ChatBubbleClipper2(type: BubbleType.receiverBubble),
                        context,
                        'panda.png'),
                    picktime(
                        ChatBubbleClipper2(type: BubbleType.receiverBubble),
                        context),
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
                                  // selectTime gives me the variable _time which is the user picked time
                                  // _time is in the format (hours: hours, minutes: minutes)
                                  selectTime(context);
                                  // i need the variable now so i now what day it is
                                  final now = new tz.TZDateTime.now(tz.local);
                                  // so i use "now" to get the day, month, and year
                                  // and _time.hour and _time.minute to get the hours and minutes
                                  final convert = new tz.TZDateTime(
                                      tz.local,
                                      now.year,
                                      now.month,
                                      now.day,
                                      _time.hour,
                                      _time.minute);

                                  print('hi $convert');

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
                                  _completedOnboarding = true;
                                  await DatabaseService(uid: user.uid)
                                      .updateOnboarding(
                                          _currentInterests ??
                                              userData.interests,
                                          _completedOnboarding ??
                                              userData.completedOnboarding,
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
