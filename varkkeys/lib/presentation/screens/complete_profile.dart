import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys/core/theme/colors.dart';
import 'package:varkkeys/presentation/controller/contact_controller.dart';
import 'package:varkkeys/widgets/app_btn.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.find<ContactController>();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: Icon(Icons.arrow_back_ios, size: 18),
        // ),
        title: Text(
          "Complete Profile",
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTextField(
                      "Qualification",
                      contactController.qualificationController,
                    ),
                    _buildTextField(
                      "Current Role",
                      contactController.roleController,
                    ),
                    _buildTextField(
                      "Remarks",
                      contactController.remarksController,
                      maxLines: 3,
                    ),
                    _buildTextField(
                      "Requirements",
                      contactController.requirementsController,
                      maxLines: 3,
                    ),
                    _buildTextField(
                      "Status",
                      contactController.statusController,
                    ),
                  ],
                ),
              ),
            ),
            AppBtn(
              onTap: () {
                contactController.completeProfile();
                Get.back();
              },
              child: Text(
                "Save Changes",
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: GoogleFonts.raleway(),
        decoration: InputDecoration(
          labelText: label,
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
    );
  }
}
