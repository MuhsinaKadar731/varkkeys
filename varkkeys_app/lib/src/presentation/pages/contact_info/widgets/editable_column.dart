import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';

import '../../edit_contact/edit_contact.dart';

class EditableColumn extends StatelessWidget {
  String label, value, fieldKey;
  final VoidCallback? onTap;
  // int index;
  EditableColumn({
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
        child: Column(
          children: [
            // Column(
            //   children: [
            Container(
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
            SizedBox(height: 5,),

            Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Text(
                  value,
                  // 'Margaret Hamilton (December 9, 1902 – May 16, 1985) was an American entertainer and educator, with a fifty-year career in entertainment spanning theater, film, radio and television. She was best known for her portrayal of the Wicked Witch of the West and her Kansas counterpart Almira Gulch in the 1939 Metro-Goldwyn-Mayer film The Wizard of Oz. A former schoolteacher, she worked as a character actress in films for seven years before she was offered the role that defined her public image. In later years, Hamilton appeared in films and made frequent cameo appearances on television sitcoms and commercials. She also gained recognition for her work as an advocate of causes designed to benefit children and animals and retained a lifelong commitment to public education. This photograph shows Hamilton as Miss Eddels in Sid and Marty Krofft\'s Sigmund and the Sea Monsters c. 1973. Margaret Hamilton (December 9, 1902 – May 16, 1985) was an American entertainer and educator, with a fifty-year career in entertainment spanning theater, film, radio and television. She was best known for her portrayal of the Wicked Witch of the West and her Kansas counterpart Almira Gulch in the 1939 Metro-Goldwyn-Mayer film The Wizard of Oz. A former schoolteacher, she worked as a character actress in films for seven years before she was offered the role that defined her public image. In later years, Hamilton appeared in films and made frequent cameo appearances on television sitcoms and commercials. She also gained recognition for her work as an advocate of causes designed to benefit children and animals and retained a lifelong commitment to public education. This photograph shows Hamilton as Miss Eddels in Sid and Marty Krofft\'s Sigmund and the Sea Monsters c. 1973. Margaret Hamilton (December 9, 1902 – May 16, 1985) was an American entertainer and educator, with a fifty-year career in entertainment spanning theater, film, radio and television. She was best known for her portrayal of the Wicked Witch of the West and her Kansas counterpart Almira Gulch in the 1939 Metro-Goldwyn-Mayer film The Wizard of Oz. A former schoolteacher, she worked as a character actress in films for seven years before she was offered the role that defined her public image. In later years, Hamilton appeared in films and made frequent cameo appearances on television sitcoms and commercials. She also gained recognition for her work as an advocate of causes designed to benefit children and animals and retained a lifelong commitment to public education. This photograph shows Hamilton as Miss Eddels in Sid and Marty Krofft\'s Sigmund and the Sea Monsters c. 1973.',
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
