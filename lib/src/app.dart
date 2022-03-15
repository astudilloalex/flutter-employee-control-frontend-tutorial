import 'package:employees_control/src/app_binding.dart';
import 'package:employees_control/src/ui/routes/route_names.dart';
import 'package:employees_control/src/ui/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: RoutePages.all,
      initialRoute: RouteNames.splash,
      initialBinding: const AppBinding(),
    );
  }
}
