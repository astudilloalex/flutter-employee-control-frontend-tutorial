import 'package:employees_control/src/app_controller.dart';
import 'package:employees_control/src/ui/pages/employee_task/employee_task_controller.dart';
import 'package:get/get.dart';

class EmployeeTaskBinding implements Bindings {
  const EmployeeTaskBinding();

  @override
  void dependencies() {
    Get.lazyPut<EmployeeTaskController>(
      () => EmployeeTaskController(Get.find<AppController>()),
    );
  }
}
