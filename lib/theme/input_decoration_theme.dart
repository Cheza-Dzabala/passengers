import 'package:flutter/material.dart';
import 'package:passengers/utils/colors.dart';

InputDecorationTheme kInputDecorationTheme() {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    filled: true,
    fillColor: inputFillColor,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    hintStyle: TextStyle(
      color: inputHintColor,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
  );
}
