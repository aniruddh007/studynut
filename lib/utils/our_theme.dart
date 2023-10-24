import 'package:flutter/material.dart';

class OurTheme {
  final _lightGreen = const  Color.fromARGB(255, 213, 235, 220);
  final Color _lightGrey = const  Color.fromARGB(255, 164, 164, 164);
  final Color _darkerGrey =  const Color.fromARGB(255, 119, 124, 135);

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: _lightGreen,
      primaryColor: _lightGreen,
      secondaryHeaderColor: _darkerGrey,
      hintColor: _lightGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: _lightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: _lightGreen,
          ),
        ),
      ),
    );
  }
}