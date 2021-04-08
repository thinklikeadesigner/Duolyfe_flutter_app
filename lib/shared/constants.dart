import 'package:flutter/material.dart';
import '../theme.dart';

const TextInputDecoration = InputDecoration(
  // hintText: 'Password', use. InputDecoration.copyWith(hintText: 'Email')
  fillColor: Colors.white,
  filled: true,
  isCollapsed: true,
  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(20.0))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryTeal, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(20.0))),
);
