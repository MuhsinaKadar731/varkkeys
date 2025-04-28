import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys/core/theme/colors.dart';
import 'package:varkkeys/presentation/controller/contact_controller.dart';
import 'package:varkkeys/presentation/screens/complete_profile.dart';

import 'edit_field.dart';

class EditPage extends StatelessWidget {
  final String number;
  const EditPage({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.find<ContactController>();

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => EditFieldPage(
                          title: "Name",
                          controller: contactController.nameController,
                          onSave: () {},
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 30),
                        Text(
                          contactController.nameController.text,
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Edit",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    contactController.phoneController.text,
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => EditFieldPage(
                                title: "Qualification",
                                controller:
                                    contactController.qualificationController,
                                onSave: () {},
                              ),
                            );
                          },
                          child: Container(
                            color: AppColors.scaffoldBackground,
                            width: MediaQuery.of(context).size.width - 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start, // Align top for multiline
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Qualification",
                                        style: GoogleFonts.raleway(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        contactController
                                                .qualificationController
                                                .text
                                                .isEmpty
                                            ? "Not Updated"
                                            : contactController
                                                .qualificationController
                                                .text,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.raleway(
                                          fontSize: 18,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ), // Add spacing between text and "Edit"
                                Text(
                                  "Edit",
                                  style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => EditFieldPage(
                                title: "Current Role",
                                controller: contactController.roleController,
                                onSave: () {},
                              ),
                            );
                          },
                          child: Container(
                            color: AppColors.scaffoldBackground,
                            width: MediaQuery.of(context).size.width - 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start, // Align top for multiline
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Current Role",
                                        style: GoogleFonts.raleway(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        contactController
                                                .roleController
                                                .text
                                                .isEmpty
                                            ? "Not Updated"
                                            : contactController
                                                .roleController
                                                .text,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.raleway(
                                          fontSize: 18,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ), // Add spacing between text and "Edit"
                                Text(
                                  "Edit",
                                  style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => EditFieldPage(
                                title: "Status",
                                controller: contactController.statusController,
                                onSave: () {},
                              ),
                            );
                          },
                          child: Container(
                            color: AppColors.scaffoldBackground,
                            width: MediaQuery.of(context).size.width - 60,
                            // padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left Column for title and value
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status",
                                        style: GoogleFonts.raleway(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        contactController
                                                .statusController
                                                .text
                                                .isEmpty
                                            ? "Not Updated"
                                            : contactController
                                                .statusController
                                                .text,
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                        ),
                                        softWrap: true,
                                        // maxLines: 4,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),

                                // Right side Edit text
                                const SizedBox(width: 10),
                                Text(
                                  "Edit",
                                  style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => EditFieldPage(
                                title: "Requirements",
                                controller:
                                    contactController.requirementsController,
                                onSave: () {},
                              ),
                            );
                          },
                          child: Container(
                            color: AppColors.scaffoldBackground,
                            width: MediaQuery.of(context).size.width - 60,
                            // padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left Column for title and value
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Requirements",
                                        style: GoogleFonts.raleway(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        contactController
                                                .requirementsController
                                                .text
                                                .isEmpty
                                            ? "Not Updated"
                                            : contactController
                                                .requirementsController
                                                .text,
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                        ),
                                        softWrap: true,
                                        // maxLines: 4,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),

                                // Right side Edit text
                                const SizedBox(width: 10),
                                Text(
                                  "Edit",
                                  style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => EditFieldPage(
                                title: "Remarks",
                                controller: contactController.remarksController,
                                onSave: () {},
                              ),
                            );
                          },
                          child: Container(
                            color: AppColors.scaffoldBackground,
                            width: MediaQuery.of(context).size.width - 60,
                            // padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left Column for title and value
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Remarks",
                                        style: GoogleFonts.raleway(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        contactController
                                                .remarksController
                                                .text
                                                .isEmpty
                                            ? "Not Updated"
                                            : contactController
                                                .remarksController
                                                .text,
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                        ),
                                        softWrap: true,
                                        // maxLines: 4,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),

                                // Right side Edit text
                                const SizedBox(width: 10),
                                Text(
                                  "Edit",
                                  style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SingleChildScrollView(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  // Container(
                  //   height: 120,
                  //   width: 120,
                  //   decoration: BoxDecoration(
                  //     color: Colors.blueGrey[100],
                  //     borderRadius: BorderRadius.circular(100),
                  //   ),
                  // ),
                  //       const SizedBox(height: 10),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.to(
                  //       () => EditFieldPage(
                  //         title: "Name",
                  //         controller: phoneDetailController.nameController,
                  //         onSave: () {},
                  //       ),
                  //     );
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       const SizedBox(width: 30),
                  //       Text(
                  //         phoneDetailController.nameController.text,
                  //         style: GoogleFonts.raleway(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //           color: AppColors.primaryColor,
                  //         ),
                  //       ),
                  //       const SizedBox(width: 10),
                  //       Text(
                  //         "Edit",
                  //         style: GoogleFonts.raleway(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // Text(
                  //   phoneDetailController.phoneController.text,
                  //   style: GoogleFonts.raleway(
                  //     fontSize: 20,
                  //     color: AppColors.primaryColor,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, right: 20),
                  //   child: Row(
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           Get.to(
                  //             () => EditFieldPage(
                  //               title: "Qualification",
                  //               controller:
                  //                   phoneDetailController
                  //                       .qualificationController,
                  //               onSave: () {},
                  //             ),
                  //           );
                  //         },
                  //         child: Container(
                  //           color: Colors.amber,
                  //           width: MediaQuery.of(context).size.width - 60,
                  //           child: Row(
                  //             mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Column(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     "Qualification",
                  //                     style: GoogleFonts.raleway(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   SizedBox(height: 4),
                  //                   _infoText(
                  //                     phoneDetailController
                  //                             .qualificationController
                  //                             .text
                  //                             .isEmpty
                  //                         ? "Not Updated"
                  //                         : phoneDetailController
                  //                             .qualificationController
                  //                             .text,
                  //                     context,
                  //                   ),
                  //                 ],
                  //               ),
                  //               Text(
                  //                 "Edit",
                  //                 style: GoogleFonts.raleway(
                  //                   color: Colors.black,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, right: 20),
                  //   child: Row(
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           Get.to(
                  //             () => EditFieldPage(
                  //               title: "Current Role",
                  //               controller:
                  //                   phoneDetailController.roleController,
                  //               onSave: () {},
                  //             ),
                  //           );
                  //         },
                  //         child: Container(
                  //           color: Colors.amber,
                  //           width: MediaQuery.of(context).size.width - 60,
                  //           child: Row(
                  //             mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Column(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     "Current Role",
                  //                     style: GoogleFonts.raleway(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   SizedBox(height: 4),
                  //                   _infoText(
                  //                     phoneDetailController
                  //                             .roleController
                  //                             .text
                  //                             .isEmpty
                  //                         ? "Not Updated"
                  //                         : phoneDetailController
                  //                             .roleController
                  //                             .text,
                  //                     context,
                  //                   ),
                  //                 ],
                  //               ),
                  //               Text(
                  //                 "Edit",
                  //                 style: GoogleFonts.raleway(
                  //                   color: Colors.black,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, right: 20),
                  //   child: Row(
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           Get.to(
                  //             () => EditFieldPage(
                  //               title: "Current Role",
                  //               controller:
                  //                   phoneDetailController.roleController,
                  //               onSave: () {},
                  //             ),
                  //           );
                  //         },
                  //         child: Container(
                  //           color: Colors.amber,
                  //           width: MediaQuery.of(context).size.width - 60,
                  //           padding: const EdgeInsets.all(10),
                  //           child: Row(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               // Left Column for title and value
                  //               Expanded(
                  //                 child: Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text(
                  //                       "Status",
                  //                       style: GoogleFonts.raleway(
                  //                         fontSize: 18,
                  //                         fontWeight: FontWeight.bold,
                  //                       ),
                  //                     ),
                  //                     const SizedBox(height: 4),
                  //                     Text(
                  //                       phoneDetailController
                  //                               .statusController
                  //                               .text
                  //                               .isEmpty
                  //                           ? "Not Updated"
                  //                           : phoneDetailController
                  //                               .statusController
                  //                               .text,
                  //                       style: GoogleFonts.raleway(
                  //                         fontSize: 16,
                  //                       ),
                  //                       softWrap: true,
                  //                       maxLines: 4,
                  //                       overflow: TextOverflow.ellipsis,
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),

                  //               // Right side Edit text
                  //               const SizedBox(width: 10),
                  //               Text(
                  //                 "Edit",
                  //                 style: GoogleFonts.raleway(
                  //                   color: Colors.black,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //       SizedBox(height: 10),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 20, right: 20),
                  //         child: Row(
                  //           children: [
                  //             GestureDetector(
                  //               onTap: () {
                  //                 Get.to(
                  //                   () => EditFieldPage(
                  //                     title: "Requirements",
                  //                     controller:
                  //                         phoneDetailController
                  //                             .requirementsController,
                  //                     onSave: () {},
                  //                   ),
                  //                 );
                  //               },
                  //               child: Container(
                  //                 color: Colors.amber,
                  //                 width: MediaQuery.of(context).size.width - 60,
                  //                 padding: const EdgeInsets.all(10),
                  //                 child: Row(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     // Left Column for title and value
                  //                     Expanded(
                  //                       child: Column(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                             "Requirements",
                  //                             style: GoogleFonts.raleway(
                  //                               fontSize: 18,
                  //                               fontWeight: FontWeight.bold,
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 4),
                  //                           Text(
                  //                             phoneDetailController
                  //                                     .requirementsController
                  //                                     .text
                  //                                     .isEmpty
                  //                                 ? "Not Updated"
                  //                                 : phoneDetailController
                  //                                     .requirementsController
                  //                                     .text,
                  //                             style: GoogleFonts.raleway(
                  //                               fontSize: 16,
                  //                             ),
                  //                             softWrap: true,
                  //                             maxLines: 4,
                  //                             overflow: TextOverflow.ellipsis,
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),

                  //                     // Right side Edit text
                  //                     const SizedBox(width: 10),
                  //                     Text(
                  //                       "Edit",
                  //                       style: GoogleFonts.raleway(
                  //                         color: Colors.black,
                  //                         fontWeight: FontWeight.bold,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(height: 10),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 20, right: 20),
                  //         child: Row(
                  //           children: [
                  //             GestureDetector(
                  //               onTap: () {
                  //                 Get.to(
                  //                   () => EditFieldPage(
                  //                     title: "Remarks",
                  //                     controller:
                  //                         phoneDetailController.remarksController,
                  //                     onSave: () {},
                  //                   ),
                  //                 );
                  //               },
                  //               child: Container(
                  //                 color: Colors.amber,
                  //                 width: MediaQuery.of(context).size.width - 60,
                  //                 padding: const EdgeInsets.all(10),
                  //                 child: Row(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     // Left Column for title and value
                  //                     Expanded(
                  //                       child: Column(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                             "Remarks",
                  //                             style: GoogleFonts.raleway(
                  //                               fontSize: 18,
                  //                               fontWeight: FontWeight.bold,
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 4),
                  //                           Text(
                  //                             phoneDetailController
                  //                                     .remarksController
                  //                                     .text
                  //                                     .isEmpty
                  //                                 ? "Not Updated"
                  //                                 : phoneDetailController
                  //                                     .remarksController
                  //                                     .text,
                  //                             style: GoogleFonts.raleway(
                  //                               fontSize: 16,
                  //                             ),
                  //                             softWrap: true,
                  //                             maxLines: 4,
                  //                             overflow: TextOverflow.ellipsis,
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),

                  //                     // Right side Edit text
                  //                     const SizedBox(width: 10),
                  //                     Text(
                  //                       "Edit",
                  //                       style: GoogleFonts.raleway(
                  //                         color: Colors.black,
                  //                         fontWeight: FontWeight.bold,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const CompleteProfile());
                },
                child: _actionButton(context, "Complete Profile"),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  final phoneValidationMessage =
                      contactController.validatePhoneNumber();
                  if (phoneValidationMessage != null) {
                    Get.snackbar(
                      'Validation Error',
                      phoneValidationMessage,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 3),
                    );
                  } else {
                    contactController.setProfileDetails(number);
                  }
                },
                child: _actionButton(context, "Save Profile"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _infoText(String text, BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.raleway(fontSize: 18, color: AppColors.blackColor),
    );
  }

  Widget _infoTextColumn(String text, BuildContext context) {
    return Container(
      color: AppColors.scaffoldBackground,

      child: Text(
        text,
        style: GoogleFonts.raleway(fontSize: 18, color: AppColors.blackColor),
      ),
    );
  }

  Widget _actionButton(BuildContext context, String text) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 40,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: AppColors.buttonShadowColor,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
