import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';
import 'package:varkkeys_app/src/presentation/controllers/contact_controller.dart';
import 'package:varkkeys_app/src/data/models/contact.dart';
import 'package:varkkeys_app/src/presentation/pages/edit_contact.dart';

class ContactInfo extends StatelessWidget {
  final int index;

  const ContactInfo({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final contactController =
        Get.find<ContactController>(); // Access the controller

    // Using Obx to make the widget rebuild when 'contacts' changes
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'Contact Info',
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),

      body: Obx(() {
        final contact =
            contactController
                .contacts[index]; // Get updated contact from the observable list

        Widget editableRow(String label, String value, String fieldKey) {
          final labelStyle = GoogleFonts.urbanist(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          );
          final valueStyle = GoogleFonts.urbanist(fontSize: 18);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                // Expanded(flex: 2, child: Text('$label', style: labelStyle)),
                Container(width: 90, child: Text('$label', style: labelStyle)),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Text(
                    value,
                    style: valueStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackground,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.blackColor, width: 1),
                  ),
                  child: TextButton(
                    child: Text(
                      "Edit",
                      style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    onPressed: () {
                      Get.to(
                        () => EditContactPage(index: index),
                      ); // Navigate to the Edit page
                    },
                  ),
                ),
              ],
            ),
          );
        }

        Widget editableColumn(String label, String value, String fieldKey) {
          final labelStyle = GoogleFonts.urbanist(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          );
          final valueStyle = GoogleFonts.urbanist(fontSize: 18);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 120,
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
                    SizedBox(height: 5),

                    Container(
                      width: MediaQuery.of(context).size.width - 120,
                      child: Text(
                        value,
                        style: GoogleFonts.urbanist(
                          fontSize: 18,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 65,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackground,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.blackColor, width: 1),
                  ),
                  child: TextButton(
                    child: Text(
                      "Edit",
                      style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    // icon: const Icon(Icons.edit),
                    onPressed: () {
                      Get.to(
                        () => EditContactPage(index: index),
                      ); // Navigate to the Edit page
                    },
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    // editableRow('Name', contact.name, 'name'),
                    // editableRow('Phone', contact.contactNumber, 'contactNumber'),
                    // editableRow('Qualification', contact.qualification, 'qualification'),
                    // editableRow('Current Role', contact.currentRole, 'currentRole'),
                    editableColumn('Name', contact.name, 'name'),
                    editableColumn(
                      'Phone',
                      contact.contactNumber,
                      'contactNumber',
                    ),
                    editableColumn(
                      'Qualification',
                      contact.qualification,
                      'qualification',
                    ),
                    editableColumn(
                      'Current Role',
                      contact.currentRole,
                      'currentRole',
                    ),

                    editableColumn('Status', contact.status, 'status'),

                    editableColumn('Remarks', contact.remarks, 'remarks'),
                    editableColumn(
                      'Requirements',
                      contact.requirements,
                      'requirements',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
