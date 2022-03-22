import 'package:flutter/material.dart';
import 'package:passengers/utils/colors.dart';

ElevatedButtonThemeData kElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}
