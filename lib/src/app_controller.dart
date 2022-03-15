import 'package:employees_control/src/ui/routes/route_names.dart';
import 'package:employees_control/src/ui/widgets/snackbars/error_snackbar.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  void manageError(final String error) {
    if (error == 'security-token-required' ||
        error == 'invalid-token' ||
        error == 'token-has-expired' ||
        error == 'Your credentials are incorrect') {
      Get.offAllNamed(RouteNames.signIn);
      Get.showSnackbar(ErrorSnackbar(error));
    } else {
      Get.showSnackbar(ErrorSnackbar(error));
    }
  }
}
