import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackBar({
  required String title,
  required String message,
  required Color color,
}) {
  return Get.snackbar(
    title,
    message,
    colorText: Colors.white,
    backgroundColor: color,
  );
}
