import 'package:flutter/material.dart';
import 'package:passengers/theme/elevate_button_theme.dart';
import 'package:passengers/theme/input_decoration_theme.dart';
import 'package:passengers/theme/text_theme.dart';
import 'package:passengers/utils/colors.dart';

ThemeData kPassengersTheme() {
  return ThemeData(
    primaryColor: primaryColor,
    fontFamily: 'Poppins',
    textTheme: kTextTheme(),
    elevatedButtonTheme: kElevatedButtonTheme(),
    inputDecorationTheme: kInputDecorationTheme(),
  );
}
