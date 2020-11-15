import 'package:flutter/material.dart';
import 'package:preview/preview.dart';

class ErrorRoutePage extends StatelessWidget with Previewer {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('Error'),
      ),
    );
  }
}
