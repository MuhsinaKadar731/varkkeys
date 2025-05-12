import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';
import 'package:varkkeys_app/src/presentation/controllers/contact_controller.dart';
import 'package:varkkeys_app/src/data/models/contact.dart';
import 'package:varkkeys_app/src/widgets/app_btn.dart';

class EditContactPage extends StatelessWidget {
  final int index;

  const EditContactPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final contactController =
        Get.find<ContactController>(); // Access the controller
    final contact = contactController.contacts[index];

    final _formKey = GlobalKey<FormState>();

    // TextEditingControllers to update each field
    final TextEditingController nameController = TextEditingController(
      text: contact.name,
    );
    final TextEditingController phoneController = TextEditingController(
      text: contact.contactNumber,
    );
    final TextEditingController qualificationController = TextEditingController(
      text: contact.qualification,
    );
    final TextEditingController roleController = TextEditingController(
      text: contact.currentRole,
    );
    final TextEditingController statusController = TextEditingController(
      text: contact.status,
    );
    final TextEditingController remarksController = TextEditingController(
      text: contact.remarks,
    );
    final TextEditingController requirementsController = TextEditingController(
      text: contact.requirements,
    );

    Future<void> saveContact() async {
      if (_formKey.currentState?.validate() ?? false) {
        // Create an updated contact object
        final updatedContact = Contact(
          contactNumber: phoneController.text.trim(),
          name: nameController.text.trim(),
          qualification: qualificationController.text.trim(),
          currentRole: roleController.text.trim(),
          status: statusController.text.trim(),
          remarks: remarksController.text.trim(),
          requirements: requirementsController.text.trim(),
        );

        String phone = updatedContact.contactNumber.trim();

        if (phone.isEmpty) {
          Get.snackbar(
            'Error',
            'Please enter your phone number',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
          );
          return;
        }

        if (!contactController.isValidPhoneNumber(phone)) {
          Get.snackbar(
            'Invalid Phone Number',
            'Please enter a valid 10-digit phone number.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
          contactController.isPhoneValid.value = false;
          return;
        } else {
          contactController.isPhoneValid.value = true;
        }
        if (contactController.isPhoneValid.value) {
          // Save the updated contact in the Hive box
          contactController.updateField(index, 'name', updatedContact.name);
          contactController.updateField(
            index,
            'contactNumber',
            updatedContact.contactNumber,
          );
          contactController.updateField(
            index,
            'qualification',
            updatedContact.qualification,
          );
          contactController.updateField(
            index,
            'currentRole',
            updatedContact.currentRole,
          );
          contactController.updateField(index, 'status', updatedContact.status);
          contactController.updateField(
            index,
            'remarks',
            updatedContact.remarks,
          );
          contactController.updateField(
            index,
            'requirements',
            updatedContact.requirements,
          );

          // Navigate back to the previous page after saving
          Navigator.pop(context);
        } else {
          log("bjsghfghjagdf");
        }
      }
    }

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'Edit Contact',
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          cursorColor: AppColors.blackColor,
                          style: GoogleFonts.raleway(
                            fontSize: 15,
                            color: AppColors.blackColor,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: GoogleFonts.raleway(
                              fontSize: 23,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.blackColor,
                                width: 2,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              // Optional: default underline
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          validator:
                              (value) =>
                                  value?.isEmpty ?? true
                                      ? 'Please enter name'
                                      : null,
                        ),

                        const SizedBox(height: 10),
                        TextFormField(
                          controller: phoneController,
                          cursorColor: AppColors.blackColor,
                          style: GoogleFonts.raleway(
                            fontSize: 15,
                            color: AppColors.blackColor,
                          ),
                          maxLength: 10,

                          decoration: InputDecoration(
                             counterText: '', // 👈 Hides the character counter
                            labelText: 'Phone',
                            labelStyle: GoogleFonts.raleway(
                              fontSize: 23,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.blackColor,
                                width: 2,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              // Optional: default underline
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          validator:
                              (value) =>
                                  value?.isEmpty ?? true
                                      ? 'Please enter phone number'
                                      : null,
                        ),
                        // TextFormField(
                        //   controller: phoneController,
                        //   style: GoogleFonts.raleway(
                        //     fontSize: 15,
                        //     color: AppColors.blackColor,
                        //   ),
                        //   decoration: InputDecoration(
                        //     labelText: 'Phone',
                        //     labelStyle: GoogleFonts.urbanist(
                        //       fontSize: 23,
                        //       color: AppColors.blackColor,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        //   validator:
                        //       (value) =>
                        //           value?.isEmpty ?? true
                        //               ? 'Please enter phone number'
                        //               : null,
                        // ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: qualificationController,
                          style: GoogleFonts.raleway(
                            fontSize: 15,
                            color: AppColors.blackColor,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Qualification',
                            labelStyle: GoogleFonts.urbanist(
                              fontSize: 23,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator:
                              (value) =>
                                  value?.isEmpty ?? true
                                      ? 'Please enter qualification'
                                      : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: roleController,
                          style: GoogleFonts.raleway(
                            fontSize: 15,
                            color: AppColors.blackColor,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Current Role',
                            labelStyle: GoogleFonts.urbanist(
                              fontSize: 23,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator:
                              (value) =>
                                  value?.isEmpty ?? true
                                      ? 'Please enter current role'
                                      : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: statusController,
                          style: GoogleFonts.raleway(
                            fontSize: 15,
                            color: AppColors.blackColor,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Status',
                            labelStyle: GoogleFonts.urbanist(
                              fontSize: 23,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator:
                              (value) =>
                                  value?.isEmpty ?? true
                                      ? 'Please enter status'
                                      : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: remarksController,
                          style: GoogleFonts.raleway(
                            fontSize: 15,
                            color: AppColors.blackColor,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Remarks',
                            labelStyle: GoogleFonts.urbanist(
                              fontSize: 23,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator:
                              (value) =>
                                  value?.isEmpty ?? true
                                      ? 'Please enter remarks'
                                      : null,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: requirementsController,
                          style: GoogleFonts.raleway(
                            fontSize: 15,
                            color: AppColors.blackColor,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Requirements',
                            labelStyle: GoogleFonts.urbanist(
                              fontSize: 23,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator:
                              (value) =>
                                  value?.isEmpty ?? true
                                      ? 'Please enter requirements'
                                      : null,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                AppBtn(
                  onTap: saveContact,
                  child: Text(
                    'Save Changes',
                    style: GoogleFonts.urbanist(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Form(
      //     key: _formKey,
      //     child: Expanded(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           SingleChildScrollView(
      //             child: Column(
      //               children: [
      //                 TextFormField(
      //                   controller: nameController,
      //                   decoration:  InputDecoration(labelText: 'Name', labelStyle: GoogleFonts.urbanist(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.bold)),

      //                   validator:
      //                       (value) =>
      //                           value?.isEmpty ?? true ? 'Please enter name' : null,
      //                 ),
      //                 SizedBox(height: 10,),
      //                 TextFormField(
      //                   controller: phoneController,
      //                   decoration:  InputDecoration(labelText: 'Phone',labelStyle: GoogleFonts.urbanist(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.bold)),
      //                   validator:
      //                       (value) =>
      //                           value?.isEmpty ?? true
      //                               ? 'Please enter phone number'
      //                               : null,
      //                 ),
      //                                     SizedBox(height: 10,),

      //                 TextFormField(
      //                   controller: qualificationController,
      //                   decoration:  InputDecoration(labelText: 'Qualification',labelStyle: GoogleFonts.urbanist(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.bold)),
      //                   validator:
      //                       (value) =>
      //                           value?.isEmpty ?? true
      //                               ? 'Please enter qualification'
      //                               : null,
      //                 ),
      //                                     SizedBox(height: 10,),

      //                 TextFormField(
      //                   controller: roleController,
      //                   decoration:  InputDecoration(labelText: 'Current Role',labelStyle: GoogleFonts.urbanist(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.bold)),
      //                   validator:
      //                       (value) =>
      //                           value?.isEmpty ?? true
      //                               ? 'Please enter current role'
      //                               : null,
      //                 ),
      //                                     SizedBox(height: 10,),

      //                 TextFormField(
      //                   controller: statusController,
      //                   decoration:  InputDecoration(labelText: 'Status', labelStyle: GoogleFonts.urbanist(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.bold)),
      //                   validator:
      //                       (value) =>
      //                           value?.isEmpty ?? true ? 'Please enter status' : null,
      //                 ),
      //                                     SizedBox(height: 10,),

      //                 TextFormField(
      //                   controller: remarksController,
      //                   decoration:  InputDecoration(labelText: 'Remarks',labelStyle: GoogleFonts.urbanist(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.bold)),
      //                   validator:
      //                       (value) =>
      //                           value?.isEmpty ?? true ? 'Please enter remarks' : null,
      //                 ),
      //                                     SizedBox(height: 10,),

      //                 TextFormField(
      //                   controller: requirementsController,
      //                   decoration:  InputDecoration(labelText: 'Requirements',labelStyle: GoogleFonts.urbanist(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.bold)),
      //                   validator:
      //                       (value) =>
      //                           value?.isEmpty ?? true
      //                               ? 'Please enter requirements'
      //                               : null,
      //                 ),

      //                 // ElevatedButton(
      //                 //   onPressed: saveContact,
      //                 //   child: const Text('Save Changes'),
      //                 // ),
      //               ],
      //             ),
      //           ),
      //           AppBtn(onTap: saveContact, child:  Text('Save Changes', style: GoogleFonts.raleway(
      //                   fontSize: 24,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.white,
      //                 ),)),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
