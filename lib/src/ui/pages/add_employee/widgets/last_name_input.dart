import 'package:employees_control/src/ui/pages/add_employee/add_employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastNameInput extends StatelessWidget {
  const LastNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddEmployeeController controller = Get.find<AddEmployeeController>();
    return TextFormField(
      controller: controller.lastNameController,
      decoration: const InputDecoration(hintText: 'Last name'),
    );
  }
}
