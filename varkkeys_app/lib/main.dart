import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:varkkeys_app/src/data/models/contact.dart';
import 'package:varkkeys_app/src/presentation/pages/data.dart';
import 'package:varkkeys_app/src/presentation/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ContactAdapter());
  await Hive.openBox<Contact>('contacts');

  runApp(DevicePreview(builder: (context) => MyApp()));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.blackColor,
          selectionColor: AppColors.blackColor.withOpacity(
            0.3,
          ), // Highlighted text background
          selectionHandleColor: AppColors.blackColor, // The "balloon" or draggable handle
        ),
      ),
    );
  }
}
