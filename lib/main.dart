// Import necessary packages and files.
import 'package:communere/app/di/main_binding.dart';
import 'package:communere/app/resources/app_text.dart';
import 'package:communere/app/router/pages.dart';
import 'package:communere/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Main function to run the Flutter application.
void main() async {
  // Ensure that Flutter bindings are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from the .env file.
  await dotenv.load(fileName: ".env");

  // Run the application with the MyApp widget.
  runApp(const MyApp());
}

// MyApp widget, representing the root of the application.
class MyApp extends StatelessWidget {
  // Constructor for the MyApp widget.
  const MyApp({super.key});

  // Build method to define the overall structure of the application.
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design.
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // Use GetMaterialApp for managing the application's state and routes.
        return GetMaterialApp(
          locale: Get.locale,  // Set the locale for localization.
          title: AppText.appName,  // Set the application title.
          initialBinding: MainBinding(),  // Use MainBinding for initial setup and dependency injection.
          debugShowCheckedModeBanner: true,  // Show the debug banner in checked mode.
          initialRoute: HomeScreen.url,  // Set the initial route to the HomeScreen.
          getPages: AppPages.pages,  // Define the application's pages using AppPages.
        );
      },
    );
  }
}
