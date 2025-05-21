import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';
import 'package:varkkeys_app/src/core/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:varkkeys_app/src/data/models/login_response/login_response.dart';
import 'package:varkkeys_app/src/presentation/pages/data/data.dart';

import '../../data/repositories/auth_repo_impl/auth_repo_impl.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final pwdController = TextEditingController();

  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final isLoading = false.obs;
  final RxBool showLoading = false.obs;

  final AuthRepositoryImpl _authRepository = AuthRepositoryImpl();

  var token = ''.obs; // to store token on successful login

  @override
  void onClose() {
    usernameController.dispose();
    pwdController.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }

  void login() async {
    showLoading.value = true;
    log("showLoading.value => ${showLoading.value}");
    usernameFocusNode.unfocus();
    passwordFocusNode.unfocus();

    String username = usernameController.text.trim();
    String password = pwdController.text;

    if (username.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your username',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
      showLoading.value = false;
      return;
    }

    if (password.isEmpty) {
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[200],
        margin: const EdgeInsets.all(10),
        titleText: Text(
          'Invalid Password',
          style: GoogleFonts.urbanist(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        messageText: Text(
          'Please enter your password',
          style: GoogleFonts.urbanist(
            fontSize: 16,
            color: AppColors.blackColor,
          ),
        ),
      );
      showLoading.value = false;
      return;
    }

    isLoading.value = true;

    Either<Failure, LoginResponse> result = await _authRepository.login(
      username,
      password,
    );

    result.fold(
      (failure) {
        isLoading.value = false;
        showLoading.value = false;
        Get.snackbar(
          'Login Failed', // This is still needed for accessibility
          failure.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[500],
          colorText: Colors.white, // Still good for default fallback
          margin: const EdgeInsets.all(10),
          titleText: Text(
            'Login Failed',
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          messageText: Text(
            failure.message,
            style: GoogleFonts.urbanist(color: Colors.white, fontSize: 14),
          ),
        );
      },
      (loginResponse) async {
        isLoading.value = false;
        showLoading.value = false;
        token.value = loginResponse.token;
        log("Generated Token => ${token.value}");

        // Save token to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token.value);

        Get.snackbar(
          'Login Success',
          loginResponse.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
        );
        getSavedToken();

        Get.offAll(() => Data());
      },
    );
  }

  Future<String?> getSavedToken() async {
    final prefs = await SharedPreferences.getInstance();
    log("Fetched saved token successfully => ${prefs.getString('auth_token')}");
    return prefs.getString('auth_token');
  }
}
