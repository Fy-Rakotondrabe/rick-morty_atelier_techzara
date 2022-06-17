import 'package:flutter/material.dart';
import 'package:rick_morty_test/core/constants/colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: ThemeColors.main,
    secondaryHeaderColor: ThemeColors.mainDark,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    ),
  );
}
