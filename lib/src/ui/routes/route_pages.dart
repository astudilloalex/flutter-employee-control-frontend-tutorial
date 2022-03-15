import 'package:employees_control/src/ui/pages/add_employee/add_employee_binding.dart';
import 'package:employees_control/src/ui/pages/add_employee/add_employee_page.dart';
import 'package:employees_control/src/ui/pages/employee_add_task/employee_add_task_binding.dart';
import 'package:employees_control/src/ui/pages/employee_add_task/employee_add_task_controller.dart';
import 'package:employees_control/src/ui/pages/employee_add_task/employee_add_task_page.dart';
import 'package:employees_control/src/ui/pages/employee_task/employee_task_binding.dart';
import 'package:employees_control/src/ui/pages/employee_task/employee_task_page.dart';
import 'package:employees_control/src/ui/pages/home/home_binding.dart';
import 'package:employees_control/src/ui/pages/home/home_page.dart';
import 'package:employees_control/src/ui/pages/sign_in/sign_in_binding.dart';
import 'package:employees_control/src/ui/pages/sign_in/sign_in_page.dart';
import 'package:employees_control/src/ui/pages/splash/splash_binding.dart';
import 'package:employees_control/src/ui/pages/splash/splash_page.dart';
import 'package:employees_control/src/ui/routes/route_names.dart';
import 'package:get/get.dart';

class RoutePages {
  const RoutePages._();
  static List<GetPage<dynamic>> get all {
    return [
      GetPage(
        name: RouteNames.home,
        page: () => const HomePage(),
        binding: const HomeBinding(),
      ),
      GetPage(
        name: RouteNames.signIn,
        page: () => const SignInPage(),
        binding: const SignInBinding(),
      ),
      GetPage(
        name: RouteNames.splash,
        page: () => const SplashPage(),
        binding: const SplashBinding(),
      ),
      GetPage(
        name: RouteNames.addEmployee,
        page: () => const AddEmployeePage(),
        binding: const AddEmployeeBinding(),
      ),
      GetPage(
        name: RouteNames.employeeTask,
        page: () => const EmployeeTaskPage(),
        binding: const EmployeeTaskBinding(),
      ),
      GetPage(
        name: RouteNames.employeeAddTask,
        page: () => const EmployeeAddTaskPage(),
        binding: const EmployeeAddTaskBinding(),
      ),
    ];
  }
}
