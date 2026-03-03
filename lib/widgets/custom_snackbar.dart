import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void showError(String message, {String title = "Error"}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      margin: EdgeInsets.all(12),
      borderRadius: 12,
      duration: Duration(seconds: 3),
      icon: Icon(Icons.error, color: Colors.white),
    );
  }

  /// Show success snackbar
  static void showSuccess(String message, {String title = "Success"}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(12),
      borderRadius: 12,
      duration: Duration(seconds: 3),
      icon: Icon(Icons.check_circle, color: Colors.white),
    );
  }
}
