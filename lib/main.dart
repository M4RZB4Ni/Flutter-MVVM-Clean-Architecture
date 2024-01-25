import 'package:communere/app/di/main_binding.dart';
import 'package:communere/app/router/pages.dart';
import 'package:communere/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          locale: Get.locale,
          title: 'Flicker Images',
          initialBinding: MainBinding(),
          debugShowCheckedModeBanner: true,
          initialRoute: HomeScreen.url,
          getPages: AppPages.pages,
        );
      },
    );
  }
}

