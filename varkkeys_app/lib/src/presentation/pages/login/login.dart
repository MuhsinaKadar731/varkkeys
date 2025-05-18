import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';
import 'package:varkkeys_app/src/presentation/controllers/login_controller.dart';
import 'package:varkkeys_app/src/widgets/app_btn.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Image.asset(
                  'assets/images/varkkeys_logo.jpg',
                  height: 170,
                  width: 170,
                ),
                const SizedBox(height: 40),

                Row(
                  children: [
                    const SizedBox(width: 5),
                    Text(
                      'Signin to continue',
                      style: GoogleFonts.raleway(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Username Input Field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: loginController.usernameController,
                    focusNode: loginController.usernameFocusNode,
                    style: GoogleFonts.raleway(fontSize: 16),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      hintText: 'Username',
                      hintStyle: GoogleFonts.raleway(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Input Field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: loginController.pwdController,
                    focusNode: loginController.passwordFocusNode,
                    style: GoogleFonts.raleway(fontSize: 16),
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.raleway(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Obx(() {
                  return loginController.showLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.red),
                        )
                      : const SizedBox.shrink();
                }),

                const SizedBox(height: 60),

                AppBtn(
                  onTap: () {
                    if (!loginController.isLoading.value) {
                      loginController.login();
                    }
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.raleway(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:varkkeys_app/src/core/theme/colors.dart';
// import 'package:varkkeys_app/src/presentation/controllers/login_controller.dart';
// import 'package:varkkeys_app/src/widgets/app_btn.dart';

// class Login extends StatelessWidget {
//   const Login({super.key});

//   @override
//   Widget build(BuildContext context) {
//     LoginController loginController = Get.put(LoginController());
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Logo
//                 Image.asset(
//                   'assets/images/varkkeys_logo.jpg',
//                   height: 170,
//                   width: 170,
//                 ),
//                 const SizedBox(height: 40),

//                 Row(
//                   children: [
//                     SizedBox(width: 5),
//                     Text(
//                       'Signin to continue',
//                       style: GoogleFonts.raleway(
//                         color: AppColors.primaryColor,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),

//                 // Phone Input Field
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         spreadRadius: 2,
//                         blurRadius: 10,
//                       ),
//                     ],
//                   ),
//                   child: TextField(
//                     maxLength: 10,
//                     controller: loginController.phoneController,
//                     keyboardType: TextInputType.phone,
//                     focusNode: loginController.phoneFocusNode,
//                     style: GoogleFonts.raleway(fontSize: 16),
//                     decoration: InputDecoration(
//                       counterText: '', // 👈 Hides the character counter
//                       contentPadding: EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 14,
//                       ),
//                       hintText: 'Phone Number',
//                       hintStyle: GoogleFonts.raleway(fontSize: 14),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: Colors.grey.shade400,
//                           width: 1,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: Colors.grey.shade400,
//                           width: 1,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.black, width: 1.5),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Phone Input Field
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         spreadRadius: 2,
//                         blurRadius: 10,
//                       ),
//                     ],
//                   ),
//                   child: TextField(
//                     // maxLength: 10,
//                     controller: loginController.pwdController,
//                     focusNode: loginController.passwordFocusNode,
//                     style: GoogleFonts.raleway(fontSize: 16),
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       counterText: '', // 👈 Hides the character counter
//                       contentPadding: EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 14,
//                       ),
//                       hintText: 'Password',
//                       hintStyle: GoogleFonts.raleway(fontSize: 14),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: Colors.grey.shade400,
//                           width: 1,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                           color: Colors.grey.shade400,
//                           width: 1,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.black, width: 1.5),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Obx(() {
//                   return loginController.showLoading.value
//                       ? Center(
//                         child: CircularProgressIndicator(color: Colors.red),
//                       )
//                       : SizedBox.shrink();
//                 }),
//                 // loginController.showLoading.value? CircularProgressIndicator(color: AppColors.primaryColor,) : SizedBox.shrink(),
//                 const SizedBox(height: 60),

//                 AppBtn(
//                   onTap: () {
//                     if (!loginController.isLoading.value) {
//                       loginController.login();
//                     }
//                   },
//                   child: Text(
//                     "Login",
//                     style: GoogleFonts.raleway(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 24),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
