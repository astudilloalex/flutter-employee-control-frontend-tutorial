import 'package:employees_control/src/app_controller.dart';
import 'package:employees_control/src/data/http/src/employee_http.dart';
import 'package:employees_control/src/data/http/src/task_http.dart';
import 'package:employees_control/src/data/local/secure_storage_local.dart';
import 'package:employees_control/src/domain/entities/employee.dart';
import 'package:employees_control/src/domain/entities/role.dart';
import 'package:employees_control/src/domain/entities/task.dart';
import 'package:employees_control/src/domain/entities/user.dart';
import 'package:employees_control/src/domain/exceptions/http_exceptions.dart';
import 'package:employees_control/src/domain/responses/employee_response.dart';
import 'package:employees_control/src/domain/responses/task_response.dart';
import 'package:employees_control/src/ui/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.appController);

  final AppController appController;

  final User user = Get.arguments as User;

  final RxBool _loading = RxBool(false);

  final Rx<List<Employee>> _employees = Rx<List<Employee>>([]);
  final Rx<List<Task>> _tasks = Rx<List<Task>>([]);

  final TaskHttp _taskHttp = const TaskHttp();

  @override
  void onInit() {
    _load();
    super.onInit();
  }

  Future<void> _load() async {
    try {
      if (!isAdmin) {
        final TaskResponse taskResponse = await const TaskHttp().all;
        if (taskResponse.status == 200) {
          _tasks(taskResponse.tasks);
        } else {
          appController.manageError(taskResponse.message);
        }
      } else {
        final EmployeeResponse employeeResponse =
            await const EmployeeHttp().all;
        if (employeeResponse.status == 200) {
          _employees(employeeResponse.employees);
        } else {
          appController.manageError(employeeResponse.message);
        }
      }
    } on HttpException catch (e) {
      appController.manageError(e.message);
    } catch (e) {
      appController.manageError(e.toString());
    }
  }

  void addEmployee(Employee employee) {
    final List<Employee> employees = [..._employees.value];
    employees.add(employee);
    _employees(employees);
  }

  void changeDoneState(final Task task) {
    final Task doneTask = task.copyWith(done: task.done);
    Get.showOverlay(
      loadingWidget: const Center(child: CircularProgressIndicator.adaptive()),
      asyncFunction: () async {
        try {
          final TaskResponse res = await _taskHttp.taskDone(doneTask);
          if (res.status == 200) {
            final int index = _tasks.value.indexWhere(
              (element) => element.id == task.id,
            );
            _tasks.value[index] = doneTask;
            _tasks([..._tasks.value]);
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

  void logout() {
    Get.showOverlay(
      asyncFunction: () async {
        await const SecureStorageLocal().saveToken(null);
        Get.offAllNamed(RouteNames.signIn);
      },
    );
  }

  bool get loading => _loading.value;
  List<Employee> get employees => _employees.value;
  List<Task> get tasks => _tasks.value;

  bool get isAdmin =>
      user.roles.firstWhereOrNull((element) => element.name == 'ROLE_ADMIN') !=
      null;
}
