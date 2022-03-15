import 'package:employees_control/src/domain/entities/employee.dart';
import 'package:employees_control/src/ui/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeTile extends StatelessWidget {
  const EmployeeTile({Key? key, required this.employee}) : super(key: key);

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${employee.firstName} ${employee.lastName}'),
      subtitle: Text(employee.email),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => Get.toNamed(RouteNames.employeeTask, arguments: employee),
    );
  }
}
