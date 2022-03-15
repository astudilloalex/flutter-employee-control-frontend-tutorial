import 'package:employees_control/src/ui/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTaskList extends StatelessWidget {
  const HomeTaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Obx(
      () {
        if (controller.loading) {
          return const CircularProgressIndicator.adaptive();
        }
        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (_, index) {
            return CheckboxListTile(
              value: controller.tasks[index].done,
              title: Text(controller.tasks[index].title),
              onChanged: (value) => controller.changeDoneState(
                controller.tasks[index].copyWith(done: value),
              ),
            );
          },
        );
      },
    );
  }
}
