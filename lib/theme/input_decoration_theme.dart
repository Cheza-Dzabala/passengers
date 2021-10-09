import 'package:flutter/material.dart';
import 'package:passengers/utils/colors.dart';

InputDecorationTheme kInputDecorationTheme() {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    filled: true,
    fillColor: INPUT_FILL_COLOR,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    hintStyle: TextStyle(
      color: INPUT_HINT_COLOR,
      fontSize: 16,
    ),
  );
}
