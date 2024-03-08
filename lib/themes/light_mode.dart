import 'package:flutter/material.dart';
import 'package:vishnu/fonts/app_fonts.dart';

ThemeData lightMode = ThemeData(
  textTheme: FontConfig.textTheme,
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 176, 232, 179),
    primary: Color.fromARGB(255, 1, 95, 101),
    secondary: Color.fromARGB(255, 4, 52, 60),
    tertiary: Colors.white,
    inversePrimary: Color.fromARGB(255, 4, 39, 55),
  ),
);
