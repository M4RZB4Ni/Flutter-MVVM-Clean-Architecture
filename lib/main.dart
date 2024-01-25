import 'package:communere/app/di/main_binding.dart';
import 'package:communere/app/router/pages.dart';
import 'package:communere/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          locale: Get.locale,
          title: 'CarePoint',
          initialBinding: MainBinding(),
          debugShowCheckedModeBanner: true,
          initialRoute: HomeScreen.url,
          getPages: AppPages.pages,
        );
      },
    );
  }
}

