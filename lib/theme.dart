import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    primaryColor: Colors.orangeAccent[700],
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.red),
    centerTitle: true,
    textTheme: TextTheme(
      headline5: TextStyle(
          color: Colors.orangeAccent[700], fontSize: 28, fontWeight: FontWeight.bold),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
  );

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    border: InputBorder.none,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
  );
}
