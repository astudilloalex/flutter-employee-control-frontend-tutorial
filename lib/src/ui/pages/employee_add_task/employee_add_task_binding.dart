import 'package:employees_control/src/app_controller.dart';
import 'package:employees_control/src/ui/pages/employee_add_task/employee_add_task_controller.dart';
import 'package:get/get.dart';

class EmployeeAddTaskBinding implements Bindings {
  const EmployeeAddTaskBinding();

  @override
  void dependencies() {
    Get.lazyPut<EmployeeAddTaskController>(
      () => EmployeeAddTaskController(Get.find<AppController>()),
    );
  }
}
