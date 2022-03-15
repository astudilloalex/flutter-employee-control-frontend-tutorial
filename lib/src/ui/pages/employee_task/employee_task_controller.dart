import 'package:employees_control/src/app_controller.dart';
import 'package:employees_control/src/data/http/src/task_http.dart';
import 'package:employees_control/src/domain/entities/employee.dart';
import 'package:employees_control/src/domain/entities/task.dart';
import 'package:employees_control/src/domain/exceptions/http_exceptions.dart';
import 'package:employees_control/src/domain/responses/task_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeTaskController extends GetxController {
  EmployeeTaskController(this.appController);
  final AppController appController;

  final Employee employee = Get.arguments as Employee;

  final TaskHttp _taskHttp = const TaskHttp();

  bool _loading = true;
  List<Task> _tasks = [];

  @override
  void onInit() {
    _load();
    super.onInit();
  }

  Future<void> _load() async {
    try {
      final TaskResponse res = await _taskHttp.taskByEmployee(employee.id);
      if (res.status == 200) {
        _tasks = res.tasks ?? [];
      } else {
        appController.manageError(res.message);
      }
    } on HttpException catch (e) {
      appController.manageError(e.message);
    } catch (e) {
      appController.manageError(e.toString());
    } finally {
      _loading = false;
      update();
    }
  }

  void changeDoneState(final Task task) {
    final Task doneTask = task.copyWith(done: task.done);
    Get.showOverlay(
      loadingWidget: const Center(child: CircularProgressIndicator.adaptive()),
      asyncFunction: () async {
        try {
          final TaskResponse res = await _taskHttp.taskDone(doneTask);
          if (res.status == 200) {
            final int index = _tasks.indexWhere(
              (element) => element.id == task.id,
            );
            _tasks[index] = doneTask;
            update();
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

  void addTask(Task? task) {
    if (task != null) {
      _tasks.add(task);
      update();
    }
  }

  bool get loading => _loading;
  List<Task> get tasks => _tasks;
}
