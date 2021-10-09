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
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: altButton ? BUTTON_ALT_COLOR : PRIMARY_COLOR,
      ),
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.button!.copyWith(
              color: altButton ? PRIMARY_COLOR : Colors.white,
            ),
      ),
    ),
  );
}
