import 'package:employees_control/src/ui/pages/employee_task/employee_task_controller.dart';
import 'package:employees_control/src/ui/pages/employee_task/widgets/employee_task_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeTaskList extends StatelessWidget {
  const EmployeeTaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeTaskController>(
      builder: (controller) {
        if (controller.loading) {
          return const CircularProgressIndicator.adaptive();
        }
        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (_, index) {
            return EmployeeTaskTile(task: controller.tasks[index]);
          },
        );
      },
    );
  }
}
