import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys/core/theme/colors.dart';
import 'package:varkkeys/presentation/controller/contact_controller.dart';
import 'package:varkkeys/presentation/screens/edit_page.dart';
import 'package:varkkeys/widgets/app_btn.dart';

class PhoneDetail extends StatelessWidget {
  final String number,
      name,
      status,
      qualification,
      currentRole,
      remarks,
      requirements;

  const PhoneDetail({
    super.key,
    required this.number,
    required this.name,
    required this.status,
    required this.qualification,
    required this.currentRole,
    required this.remarks,
    required this.requirements,
  });

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.find<ContactController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      contactController.loadContactDetails(number);
    });

    String getValue(String? value) {
      return (value == null || value.isEmpty) ? "Unknown" : value;
    }

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Details",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return GestureDetector(
                onTap: () {
                  contactController.showPhoneNumberDetails.value =
                      !contactController.showPhoneNumberDetails.value;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height:
                      contactController.showPhoneNumberDetails.value
                          ? MediaQuery.of(context).size.height - 180
                          : 80,
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    'Contact Number  ',
                                    style: GoogleFonts.raleway(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  getValue(number),
                                  style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor.withOpacity(
                                      0.8,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            contactController.showPhoneNumberDetails.value
                                ? Text(
                                  "Hide Details",
                                  style: GoogleFonts.raleway(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                : Text(
                                  "Show Details",
                                  style: GoogleFonts.raleway(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                'Name ',
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              contactController.nameController.text ??
                                  'Unknown',
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Status',
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          contactController.statusController.text.isEmpty
                              ? 'Unknown'
                              : contactController.statusController.text,
                          // maxLines: 4,
                          // overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Qualification ',
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              contactController
                                      .qualificationController
                                      .text
                                      .isEmpty
                                  ? 'Unknown'
                                  : contactController
                                      .qualificationController
                                      .text,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Current Role ',
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              contactController.roleController.text.isEmpty
                                  ? 'Unknown'
                                  : contactController.roleController.text,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Remarks',
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          contactController.remarksController.text.isEmpty
                              ? 'Unknown'
                              : contactController.remarksController.text,
                          // maxLines: 4,
                          // overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Requirements',
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          contactController.requirementsController.text.isEmpty
                              ? 'Unknown'
                              : contactController.requirementsController.text,
                          // maxLines: 4,
                          // overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            AppBtn(
              onTap: () {
                Get.to(() => EditPage(number: number));
              },
              child: Text(
                "Edit Profile",
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
