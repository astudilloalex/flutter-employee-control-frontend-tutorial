import 'package:employees_control/src/ui/pages/home/home_controller.dart';
import 'package:employees_control/src/ui/pages/home/widgets/employee_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeEmployeeList extends StatelessWidget {
  const HomeEmployeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Obx(
      () {
        if (controller.loading) {
          return const CircularProgressIndicator.adaptive();
        }
        return ListView.builder(
          itemCount: controller.employees.length,
          itemBuilder: (_, index) {
            return EmployeeTile(employee: controller.employees[index]);
          },
        );
      },
    );
  }
}
