import 'package:employees_control/src/ui/pages/add_employee/add_employee_controller.dart';
import 'package:employees_control/src/ui/pages/add_employee/widgets/email_input.dart';
import 'package:employees_control/src/ui/pages/add_employee/widgets/first_name_input.dart';
import 'package:employees_control/src/ui/pages/add_employee/widgets/last_name_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddEmployeeController controller = Get.find<AddEmployeeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const FirstNameInput(),
            const SizedBox(height: 15.0),
            const LastNameInput(),
            const SizedBox(height: 15.0),
            const EmailInput(),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: controller.save,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
