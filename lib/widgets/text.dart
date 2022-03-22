import 'package:flutter/material.dart';
import 'package:passengers/utils/colors.dart';

Row kActionableText({
  required BuildContext context,
  required String leadingText,
  required String trailingText,
  required Function()? onTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        leadingText.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
      ),
      SizedBox(width: 4),
      GestureDetector(
        onTap: onTap,
        child: Text(
          trailingText.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: textLinkColor, fontSize: 12),
        ),
      ),
    ],
  );
}
