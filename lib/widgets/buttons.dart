import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passengers/utils/colors.dart';

SizedBox kFullWidthButton({
  required BuildContext context,
  required Function()? onPressed,
  required String text,
  bool altButton = false,
}) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: altButton ? buttonAltColor : primaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.button!.copyWith(
              color: altButton ? primaryColor : Colors.white,
            ),
      ),
    ),
  );
}
