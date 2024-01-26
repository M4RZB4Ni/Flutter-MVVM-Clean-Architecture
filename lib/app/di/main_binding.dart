import 'package:communere/app/network/network_client.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'home_binding.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
    Get.lazyPut<NetworkClient>(NetworkClient.new, fenix: true);
  }
}
