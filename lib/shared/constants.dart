import 'package:flutter/material.dart';

const TextInputDecoration = InputDecoration(
  // hintText: 'Password', use. InputDecoration.copyWith(hintText: 'Email')
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);
