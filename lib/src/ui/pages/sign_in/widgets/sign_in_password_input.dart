import 'package:employees_control/src/ui/pages/sign_in/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPasswordInput extends StatelessWidget {
  const SignInPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();
    return TextFormField(
      controller: controller.passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }
}
