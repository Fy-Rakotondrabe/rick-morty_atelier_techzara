import 'package:flutter/material.dart';
import 'package:rick_morty_test/core/constants/colors.dart';

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: ThemeColors.mainDark,
    secondaryHeaderColor: ThemeColors.white,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    ),
  );
}
