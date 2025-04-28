import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys/core/theme/colors.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;

  const PhoneNumberField({super.key, required this.controller, this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allow only digits
          LengthLimitingTextInputFormatter(10), // Limit to 10 digits
        ],
        style: GoogleFonts.raleway(),
        decoration: InputDecoration(
          labelText: "Phone Number",
          labelStyle: GoogleFonts.raleway(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.blackColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2.5, color: AppColors.blackColor),
          ),
        ),
      ),
    );
  }
}
