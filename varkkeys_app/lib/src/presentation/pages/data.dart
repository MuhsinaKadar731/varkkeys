import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';
import 'package:varkkeys_app/src/presentation/controllers/contact_controller.dart';
import 'package:varkkeys_app/src/presentation/pages/contact_info.dart';

class Data extends StatelessWidget {
  const Data({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the ContactController instance using GetX
    ContactController contactController = Get.put(ContactController());

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Obx(() {
        final contacts = contactController.contacts;

        if (contacts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView.builder(
            itemCount: contacts.length,
            // itemCount: 40,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      log("Index : $index");
                      Get.to(() => ContactInfo(index: index));
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.tileShadowColor,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        // border: Border.all(color: AppColors.primaryColor, width: 1)
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 150,
                            child: Text(
                              contact.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              // 'fhfhfgfg',
                              style: GoogleFonts.urbanist(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                // fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              child: Text(
                                contact.contactNumber,
                                // 'fhgfhgfhgf',
                                style: GoogleFonts.urbanist(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
