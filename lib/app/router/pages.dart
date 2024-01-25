import 'package:communere/presentation/home/home_screen.dart';
import 'package:get/get.dart';

class AppPages{
  static final pages = [
      GetPage(name: HomeScreen.url, page: HomeScreen.new)
  ];
}