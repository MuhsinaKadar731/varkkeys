import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys/core/theme/colors.dart';
import 'package:varkkeys/widgets/app_btn.dart';

class EditFieldPage extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final VoidCallback onSave;

  const EditFieldPage({
    super.key,
    required this.title,
    required this.controller,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Edit $title"),
      //   backgroundColor: Colors.white,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              style: GoogleFonts.raleway(),
              decoration: InputDecoration(
                labelText: title,
                labelStyle: GoogleFonts.raleway(),
                fillColor: AppColors.primaryColor,
                focusColor: AppColors.primaryColor,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: AppColors.blackColor),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: AppColors.blackColor),
                ),
              ),
            ),
            // TextField(
            //   controller: controller,
            //   decoration: InputDecoration(
            //     labelText: title,
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(
            //         color: AppColors.primaryColor,
            //         width: 2,

            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            AppBtn(
              onTap: () {
                log("Hi");
                onSave();
                Get.back();
              },
              child: Text(
                "Save",
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // ElevatedButton(
            // onPressed: () {
            //   onSave();
            //   Get.back();
            // },
            //   child: Text("Save"),
            // ),
          ],
        ),
      ),
    );
  }
}
