import 'package:employees_control/src/domain/entities/employee.dart';
import 'package:employees_control/src/domain/responses/add_employee_response.dart';
import 'package:employees_control/src/domain/responses/employee_response.dart';

abstract class EmployeeRepository {
  const EmployeeRepository();

  Future<EmployeeResponse> get all;
  Future<AddEmployeeResponse> addEmployee(final Employee employee);
}
