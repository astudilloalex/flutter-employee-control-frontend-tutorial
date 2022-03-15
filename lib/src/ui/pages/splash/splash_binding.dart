import 'package:employees_control/src/app_controller.dart';
import 'package:employees_control/src/ui/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  const SplashBinding();

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(Get.find<AppController>()),
    );
  }
}
