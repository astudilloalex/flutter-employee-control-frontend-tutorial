import 'package:employees_control/src/app_controller.dart';
import 'package:employees_control/src/data/http/src/task_http.dart';
import 'package:employees_control/src/domain/entities/employee.dart';
import 'package:employees_control/src/domain/entities/task.dart';
import 'package:employees_control/src/domain/exceptions/http_exceptions.dart';
import 'package:employees_control/src/domain/responses/task_response.dart';
import 'package:employees_control/src/ui/pages/employee_task/employee_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeAddTaskController extends GetxController {
  EmployeeAddTaskController(this.appController);

  final AppController appController;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final Employee employee = Get.arguments as Employee;

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void addTask() {
    Get.showOverlay(
      loadingWidget: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      asyncFunction: () async {
        try {
          final TaskResponse res = await const TaskHttp().addTask(
            Task(
              id: 0,
              title: titleController.text.trim(),
              description: descriptionController.text.trim(),
              employeeId: employee.id,
            ),
          );
          if (res.status == 200) {
            Get.find<EmployeeTaskController>().addTask(res.tasks?.first);
            Get.back();
          } else {
            appController.manageError(res.message);
          }
        } on HttpException catch (e) {
          appController.manageError(e.message);
        } catch (e) {
          appController.manageError(e.toString());
        }
      },
    );
  }
}
