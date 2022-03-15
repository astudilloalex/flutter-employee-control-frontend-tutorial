import 'package:employees_control/src/ui/pages/sign_in/sign_in_controller.dart';
import 'package:employees_control/src/ui/pages/sign_in/widgets/sign_in_password_input.dart';
import 'package:employees_control/src/ui/pages/sign_in/widgets/sign_in_username_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: const [
                    SignInUsernameInput(),
                    SizedBox(height: 15.0),
                    SignInPasswordInput(),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: controller.signIn,
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
