// Create a TextTheme for the app
import 'package:flutter/material.dart';
import 'package:passengers/utils/colors.dart';

TextTheme kTextTheme() {
  return TextTheme(
    headline1: TextStyle(
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      color: kHeadingTextColor,
    ),
    headline2: TextStyle(
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      color: kHeadingTextColor,
    ),
    headline3: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      color: kHeadingTextColor,
    ),
    headline4: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      color: kHeadingTextColor,
    ),
    headline5: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      color: kHeadingTextColor,
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: kHeadingTextColor,
    ),
    subtitle1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: kHeadingTextColor,
    ),
    subtitle2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: kHeadingTextColor,
    ),
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: kHeadingTextColor,
    ),
    button: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    caption: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: kHeadingTextColor,
    ),
    overline: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: kHeadingTextColor,
    ),
  );
}
