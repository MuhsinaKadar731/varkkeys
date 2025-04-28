import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys/core/theme/colors.dart';
import 'package:varkkeys/presentation/controller/contact_controller.dart';
import 'package:varkkeys/presentation/screens/phone_detail.dart';

class Data extends StatelessWidget {
  const Data({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Contacts",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child:
            contactController.initialContacts.isEmpty
                ? Center(
                  child: Text(
                    "No contacts available.",
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                )
                : ListView.separated(
                  itemCount: contactController.initialContacts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    var contactData = contactController.initialContacts[index];
                    return Card(
                      color: AppColors.primaryColor,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            () => PhoneDetail(
                              number: contactData['contactNumber'] ?? '',
                              name: contactData['name'] ?? 'Unknown',
                              status: contactData['status'] ?? 'Unknown',
                              qualification:
                                  contactData['qualification'] ?? 'Unknown',
                              currentRole:
                                  contactData['currentRole'] ?? 'Unknown',
                              remarks: contactData['remarks'] ?? 'None',
                              requirements:
                                  contactData['requirements'] ?? 'None',
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                contactData['name'] ?? 'Unknown',
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                contactData['contactNumber'] ?? '',
                                style: GoogleFonts.raleway(
                                  fontSize: 15,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
