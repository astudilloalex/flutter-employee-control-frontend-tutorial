import 'package:employees_control/src/ui/pages/add_employee/add_employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddEmployeeController controller = Get.find<AddEmployeeController>();
    return TextFormField(
      controller: controller.emailController,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }
}
