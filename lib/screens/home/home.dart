import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:navigationapp/models/onboarding_data.dart';
import 'package:navigationapp/screens/home/user_data_list.dart';
import 'package:navigationapp/services/auth.dart';
import 'package:navigationapp/services/database.dart';
import 'package:navigationapp/widgets/chat_bubbles.dart';

import 'package:provider/provider.dart';

import '../../app.dart';

class Home extends StatefulWidget {
  final String imagePath;
  Home({Key key, @required this.imagePath}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

/// This is the private State class that goes with Home.
class _HomeState extends State<Home> {
  String thisImage;
  int _selectedIndex = 0;
  void initState() {
    super.initState();
    thisImage = widget.imagePath;
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Image(image: AssetImage("giraffe.png"), height: 130),
    Text(
      'This is where the tasks feed will be',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    Text(
      'This is where the settings screen will be',
      style: TextStyle(fontWeight: FontWeight.bold),
      textAlign: TextAlign.end,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
