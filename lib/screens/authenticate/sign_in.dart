import 'package:flutter/material.dart';
import 'package:navigationapp/screens/wrapper.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:navigationapp/shared/loading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'gmailsignin/gmail_signin.dart';

_launchURL() async {
  const url =
      'https://accounts.google.com/signup/v2/webcreateaccount?hl=en&flowName=GlifWebSignIn&flowEntry=SignUp';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final GmailAuthService _gmailAuth = GmailAuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

//text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    // if loading, show loading. if not, show scaffold

    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: SafeArea(
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
                        style:
                            TextStyle(fontSize: 32, color: Color(0xff464646)),
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
                      Image(
                        image: AssetImage("panda.png"),
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      // Container(
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //       SizedBox(height: 20.0),
                      //       SizedBox(height: 10.0),
                      //       SizedBox(height: 10.0),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 10.0),
                      SizedBox(height: 10.0),
                      SizedBox(height: 10.0),
                      SizedBox(height: 10.0),
                      SizedBox(height: 10.0),
                      SizedBox(height: 10.0),
                      _signInButton(),
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
            ),
          );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async {
        _gmailAuth.signInWithGoogle().then((result) {
          // print('signed in with google');

          if (result != null) {
            return Wrapper();
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
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
            )
          ],
        ),
      ),
    );
  }
}
