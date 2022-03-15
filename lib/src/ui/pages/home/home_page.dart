import 'package:employees_control/src/ui/pages/home/home_controller.dart';
import 'package:employees_control/src/ui/pages/home/widgets/home_employee_list.dart';
import 'package:employees_control/src/ui/pages/home/widgets/home_task_list.dart';
import 'package:employees_control/src/ui/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.isAdmin ? 'Employees' : 'Tasks',
        ),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body:
          controller.isAdmin ? const HomeEmployeeList() : const HomeTaskList(),
      floatingActionButton: controller.isAdmin
          ? FloatingActionButton(
              onPressed: () => Get.toNamed(RouteNames.addEmployee),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
