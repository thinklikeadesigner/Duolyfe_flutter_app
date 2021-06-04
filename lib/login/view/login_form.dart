import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_firebase_login/login/login.dart';
// import 'package:flutter_firebase_login/sign_up/sign_up.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme.dart';
import '../login.dart';

_launchURL() async {
  const url =
      'https://accounts.google.com/signup/v2/webcreateaccount?hl=en&flowName=GlifWebSignIn&flowEntry=SignUp';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("background.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment(-1, -1)),
        ),
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0),
              SizedBox(height: 5.0),
              SizedBox(height: 20.0),
              Text(
                'Duolyfe',
                style: TextStyle(fontSize: 32, color: Color(0xff464646)),
              ),
              SizedBox(height: 16.0),
              Text(' Disconnect from the mental load of work',
                  style: TextStyle(fontSize: 16, height: 0.66)),
              SizedBox(height: 0),
              SizedBox(height: 25),
              SizedBox(height: 20.0),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              //FIXME SIZE OF LOGO TOO SMALL
              Image(
                image: AssetImage("pandaLarge.png"),
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              OutlinedButton(
                key: const Key('loginForm_googleLogin_raisedButton'),
                onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(image: AssetImage("google_logo.png"), height: 35.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Don\'t have an account?'),
                  TextButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Sign up'),
                    onPressed: () {
                      _launchURL();
                    },
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
