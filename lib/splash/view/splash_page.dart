import 'package:flutter/material.dart';
import 'package:navigationapp/theme.dart';

//IDEA duolyfe splash screen here for phones that don't go immediately to home or login screen fast enough?
class SplashPage extends StatelessWidget {
  
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('splash_bloc_image'),
      backgroundColor: primaryTeal,
      body: Center(
        
        child: Text('Duolyfe', style: TextStyle(fontSize: 72, color: Colors.white, backgroundColor: primaryTeal, fontWeight: FontWeight.bold, letterSpacing: 4),)
      ),
    );
  }
}
