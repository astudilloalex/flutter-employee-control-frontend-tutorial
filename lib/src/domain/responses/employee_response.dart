import 'dart:convert';

import 'package:employees_control/src/domain/entities/employee.dart';

EmployeeResponse employeeResponseFromJson(String str) {
  return EmployeeResponse.fromJson(json.decode(str) as Map<String, dynamic>);
}

class EmployeeResponse {
  const EmployeeResponse({
    required this.status,
    required this.message,
    this.employees,
  });

  final int status;
  final String message;
  final List<Employee>? employees;

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) {
    final int status = json['status'] as int;
    return EmployeeResponse(
      status: status,
      message: json['message'] as String,
      employees: status != 200
          ? null
          : List<Employee>.from(
              (json['data'] as List<dynamic>).map((element) {
                return Employee.fromJson(element as Map<String, dynamic>);
              }),
            ),
    );
  }
}
