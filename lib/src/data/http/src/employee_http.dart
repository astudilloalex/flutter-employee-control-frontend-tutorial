import 'package:employees_control/src/data/http/base_http_client.dart';
import 'package:employees_control/src/data/http/url_paths.dart';
import 'package:employees_control/src/domain/entities/employee.dart';
import 'package:employees_control/src/domain/repositories/employee_repository.dart';
import 'package:employees_control/src/domain/responses/add_employee_response.dart';
import 'package:employees_control/src/domain/responses/employee_response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class EmployeeHttp implements EmployeeRepository {
  const EmployeeHttp({
    this.baseHttpClient = const BaseHttpClient(),
  });

  final BaseHttpClient baseHttpClient;

  @override
  Future<AddEmployeeResponse> addEmployee(Employee employee) async {
    try {
      final http.Response response = await baseHttpClient.post(
        UrlPaths.addEmployee,
        request: employee.toJson(),
      );
      return compute(addEmployeeResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EmployeeResponse> get all async {
    try {
      final http.Response response = await baseHttpClient.get(
        UrlPaths.allEmployees,
      );
      return compute(employeeResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }
}
