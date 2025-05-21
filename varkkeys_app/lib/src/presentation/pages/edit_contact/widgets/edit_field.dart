import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';

class EditField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String label, message;
  EditField({
    super.key,
    required this.controller,
    required this.label,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.blackColor,
      style: GoogleFonts.raleway(fontSize: 15, color: AppColors.blackColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.raleway(
          fontSize: 23,
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.blackColor, width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
          // Optional: default underline
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      validator: (value) => value?.isEmpty ?? true ? message : null,
    );
  }
}
