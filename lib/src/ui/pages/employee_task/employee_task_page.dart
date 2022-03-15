import 'package:employees_control/src/ui/pages/employee_task/employee_task_controller.dart';
import 'package:employees_control/src/ui/pages/employee_task/widgets/employee_task_list.dart';
import 'package:employees_control/src/ui/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeTaskPage extends StatelessWidget {
  const EmployeeTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmployeeTaskController controller =
        Get.find<EmployeeTaskController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${controller.employee.firstName} ${controller.employee.lastName}',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: EmployeeTaskList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(
          RouteNames.employeeAddTask,
          arguments: controller.employee,
        ),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
