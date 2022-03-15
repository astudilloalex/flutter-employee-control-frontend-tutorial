import 'package:employees_control/src/ui/pages/employee_add_task/employee_add_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeAddTaskPage extends StatelessWidget {
  const EmployeeAddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmployeeAddTaskController controller =
        Get.find<EmployeeAddTaskController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: controller.addTask,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
