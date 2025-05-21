import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';

import '../../edit_contact/edit_contact.dart';

class EditableRow extends StatelessWidget {
  String label, value, fieldKey;
  final VoidCallback? onTap;
  // int index;
  EditableRow({
    super.key,
    required this.label,
    required this.value,
    required this.fieldKey,
    required this.onTap,
    // required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = GoogleFonts.urbanist(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    );
    final valueStyle = GoogleFonts.urbanist(fontSize: 18);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        child: Row(
          children: [
            // Column(
            //   children: [
            Container(
              height: 30,
              width: 120,
              alignment: Alignment.topLeft,
              child: Text(
                '$label',
                style: GoogleFonts.urbanist(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
            ),

            Expanded(
              child: Container(
                height: 30,

                child: Text(
                  value,
                  style: GoogleFonts.urbanist(
                    fontSize: 18,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),

        // SizedBox(width: 15),
        // Container(
        //   height: 40,
        //   width: 65,
        //   decoration: BoxDecoration(
        //     color: AppColors.scaffoldBackground,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: AppColors.blackColor, width: 1),
        //   ),
        //   child: Center(
        //     child: Text(
        //       "Edit",
        //       style: GoogleFonts.urbanist(
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold,
        //         color: AppColors.blackColor,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
