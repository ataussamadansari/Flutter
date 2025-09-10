import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppHelpers {

  static void showSnackBar({
    required String title,
    required String message,
    bool isError = false,
    Duration duration = const Duration(seconds: 3)
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? Colors.red[200] : Colors.green[200],
      icon: Icon(
        isError ? Icons.error : Icons.check_circle,
        color: isError ? Colors.red : Colors.green,
      ),
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: duration,
    );
  }

  static void showLoadingDialog({String message = "Loading..."}) {
    Get.dialog(AlertDialog(content: Row(
      children: [
        const CircularProgressIndicator(),
        const SizedBox(width: 16),
        Text(message)
      ],
    )),
    barrierDismissible: false
    );
  }
}