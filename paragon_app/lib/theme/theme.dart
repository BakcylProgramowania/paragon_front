import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      secondary: Color(0xFFA7A7A7),
    ));

ThemeData darkMode = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Colors.black,
      secondary: Color(0xFFcccaca),
    ));
