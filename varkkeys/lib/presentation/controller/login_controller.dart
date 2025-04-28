import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:varkkeys/presentation/screens/data.dart'; // Add this import

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final isLoading = false.obs;

  void login() {
    String phone = phoneController.text.trim();

    if (phone.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your phone number',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
      return;
    }

    if (!isValidPhoneNumber(phone)) {
      Get.snackbar(
        'Invalid Phone Number',
        'Please enter a valid 10-digit phone number.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    } else {
      isLoading.value = true;
      log("login success");
      Future.delayed(const Duration(seconds: 1), () {
        isLoading.value = false;

        Get.offAll(() => Data()); // Navigate to Data screen
      });
    }
  }

  bool isValidPhoneNumber(String phone) {
    final regex = RegExp(r'^[0-9]{10}$');
    return regex.hasMatch(phone);
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }
}
