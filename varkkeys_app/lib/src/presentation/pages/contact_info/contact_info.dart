import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';
import 'package:varkkeys_app/src/presentation/controllers/contact_controller.dart';
import 'package:varkkeys_app/src/presentation/pages/contact_info/widgets/editable_column.dart';
import 'package:varkkeys_app/src/presentation/pages/contact_info/widgets/editable_row.dart';
import 'package:varkkeys_app/src/presentation/pages/contact_info/widgets/play_pause_btn.dart';
import 'package:varkkeys_app/src/presentation/pages/edit_contact/edit_contact.dart';
import 'package:varkkeys_app/src/widgets/app_btn.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final contactController = Get.find<ContactController>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
        final contact = contactController.selectedContact.value;

        if (contact == null) {
          return const Center(child: Text("No contact selected"));
        }

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      EditableRow(
                        label: 'Name',
                        value: contact.first_name + " " + contact.last_name,
                        fieldKey: 'name',
                        onTap: () {},
                      ),
                      EditableRow(
                        label: 'Phone',

                        value: contact.phone,
                        fieldKey: 'contactNumber',
                        onTap: () {},
                      ),
                      EditableRow(
                        label: 'Email',

                        value: contact.email,
                        fieldKey: 'email',
                        onTap: () {},
                      ),
                      EditableRow(
                        label: 'Address',

                        value: contact.address,
                        fieldKey: 'address',
                        onTap: () {},
                      ),
                      EditableRow(
                        label: 'Age',

                        value: contact.age.toString(),
                        fieldKey: 'address',
                        onTap: () {},
                      ),
                      EditableRow(
                        label: 'Qualification',

                        value: contact.qualification,
                        fieldKey: 'qualification',
                        onTap: () {},
                      ),
                      EditableRow(
                        label: 'Interested Area',

                        value: contact.interested_area,
                        fieldKey: 'interestedArea',
                        onTap: () {},
                      ),
                      EditableRow(
                        label: 'Current Role',

                        value: contact.current_role,
                        fieldKey: 'currentRole',
                        onTap: () {},
                      ),
                      EditableRow(
                        label: 'Status',
                        value: contact.status,
                        fieldKey: 'status',
                        onTap: () {},
                      ),
                       EditableRow(
                        label: 'Lead Type',
                        value: contact.lead_type,
                        fieldKey: 'lead_type',
                        onTap: () {},
                      ),
                      EditableColumn(
                        label: 'Remarks',
                        value: contact.remarks,
                        fieldKey: 'remarks',
                        onTap: () {},
                      ),
                      EditableColumn(
                        label: 'Requirements',
                        value: contact.requirements_of_candidate,

                        fieldKey: 'requirements',
                        onTap: () {},
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Call Record',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    contactController
                                                .selectedContact
                                                .value
                                                ?.audio_record
                                                ?.isNotEmpty ==
                                            true
                                        ? contactController
                                            .selectedContact
                                            .value!
                                            .audio_record
                                        : 'No audio uploaded',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PlayPauseBtn(
                              audioUrl:
                                  contact.audio_record?.startsWith('/') ?? false
                                      ? 'https://varkkyslearning.pythonanywhere.com${contact.audio_record}'
                                      : contact.audio_record ?? '',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppBtn(
                onTap: () {
                  Get.to(EditContact(contact: contact));
                },
                child: Text(
                  "Edit Contact",
                  style: GoogleFonts.raleway(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
