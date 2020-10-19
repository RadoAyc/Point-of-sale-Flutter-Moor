import 'package:flutter/material.dart';

class InputStyle {
  // Input Styles

  static const textInputDecoration = InputDecoration(
    labelText: '',
    hintText: '',
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xfff6f6f6), width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff515070), width: 2.0),
    ),
  );
}
