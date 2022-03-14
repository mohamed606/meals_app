import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  canvasColor: const Color.fromRGBO(255, 254, 229, 1),
  fontFamily: "Raleway",
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Color(0xFF143333),
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      fontFamily: "RobotoCondensed",
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
      .copyWith(secondary: Colors.amber),
);
