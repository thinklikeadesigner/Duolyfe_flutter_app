import 'package:flutter/material.dart';
import 'package:navigationapp/app.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:navigationapp/shared/constants.dart';
import 'package:navigationapp/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(height: 24),
                    Text(
                      'Duolyfe',
                      style: TextStyle(fontSize: 24, color: Color(0xff464646)),
                    ),
                    SizedBox(height: 25),
                    Text(' Disconnect from the mental load of work',
                        style: TextStyle(fontSize: 12, height: 0.66)),
                    SizedBox(height: 25),
                    Image(
                      image: AssetImage("panda.png"),
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          TextFormField(
                            style: TextStyle(fontSize: 14),
                            decoration:
                                TextInputDecoration.copyWith(hintText: 'Email'),
                            validator: (value) =>
                                value.isEmpty ? 'Enter an Email' : null,
                            onChanged: (value) {
                              setState(() => email = value);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            style: TextStyle(fontSize: 14),
                            decoration: TextInputDecoration.copyWith(
                                hintText: 'Password'),
                            validator: (value) => value.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            obscureText: true,
                            onChanged: (value) {
                              setState(() => password = value);
                            },
                          ),
                          SizedBox(height: 10.0),
                          FlatButton(
                            color: primaryTeal,
                            child: Text(
                              'Sign up',
                              style: TextStyle(color: Colors.black),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);

                                if (result == null) {
                                  setState(() =>
                                      error = 'please supply a valid email');
                                }
                              }
                            },
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Already have and account?'),
                              FlatButton.icon(
                                icon: Icon(Icons.person),
                                label: Text('Log in'),
                                onPressed: () {
                                  widget.toggleView();
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
