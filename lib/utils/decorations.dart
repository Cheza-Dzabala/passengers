import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

BoxDecoration kAuthAndOnboardingDecoration() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background.png'),
      fit: BoxFit.cover,
    ),
  );
}

BoxDecoration kAuthBottomContainerDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
    // Apply a top shadow
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, -10),
        blurRadius: 10,
      ),
    ],
  );
}
