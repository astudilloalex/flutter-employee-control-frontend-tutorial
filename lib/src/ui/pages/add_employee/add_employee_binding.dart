import 'package:employees_control/src/app_controller.dart';
import 'package:employees_control/src/ui/pages/add_employee/add_employee_controller.dart';
import 'package:get/get.dart';

class AddEmployeeBinding implements Bindings {
  const AddEmployeeBinding();

  @override
  void dependencies() {
    Get.lazyPut<AddEmployeeController>(
      () => AddEmployeeController(Get.find<AppController>()),
    );
  }
}
