import 'package:employees_control/src/domain/entities/task.dart';
import 'package:employees_control/src/ui/pages/employee_task/employee_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeTaskTile extends StatelessWidget {
  const EmployeeTaskTile({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final EmployeeTaskController controller =
        Get.find<EmployeeTaskController>();
    return CheckboxListTile(
      value: task.done,
      title: Text(task.title),
      onChanged: (value) => controller.changeDoneState(
        task.copyWith(done: value),
      ),
    );
  }
}
