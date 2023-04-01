import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      //
      labelSmall: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w500,
          fontFamily: "Yekan"),
      //
      bodyMedium: TextStyle(
          color: Colors.black54,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: "Yekan"),
      //
      displaySmall: TextStyle(
          color: Color.fromRGBO(41, 110, 72, 1),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Lalezar"),
      //
      displayMedium: TextStyle(
          color: Colors.white60,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "Yekan"),
      //
      titleLarge: TextStyle(
          color: Color(0xFF296E48),
          fontSize: 23,
          fontWeight: FontWeight.bold,
          fontFamily: "Yekan"),
      bodySmall:
          TextStyle(color: Colors.black45, fontSize: 22, fontFamily: "Yekan"),
      //
      bodyLarge:
          TextStyle(color: Colors.black38, fontSize: 20, fontFamily: "Yekan"),
      //
      titleSmall: TextStyle(
          color: Colors.black54,
          fontSize: 17,
          fontFamily: "Lalezar",
          fontWeight: FontWeight.bold),
      //
      displayLarge: TextStyle(
          color: Colors.black54,
          fontSize: 22,
          fontFamily: "Lalezar",
          fontWeight: FontWeight.bold),
    ),
    unselectedWidgetColor: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xFF296E48),
    primarySwatch: Colors.green,
    secondaryHeaderColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black54, opacity: 0.8),
  );
}
