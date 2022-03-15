import 'package:employees_control/src/app_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  const AppBinding();

  @override
  void dependencies() {
    Get.put(AppController(), permanent: true);
  }
}
