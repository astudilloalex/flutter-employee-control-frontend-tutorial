import 'package:employees_control/src/domain/entities/employee.dart';
import 'package:employees_control/src/domain/entities/role.dart';

class User {
  const User({
    required this.id,
    required this.username,
    required this.employee,
    required this.roles,
  });

  final int id;
  final String username;
  final Employee employee;
  final List<Role> roles;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      employee: Employee.fromJson(json['employee'] as Map<String, dynamic>),
      roles: List<Role>.from(
        (json['roles'] as List<dynamic>).map((element) {
          return Role.fromJson(element as Map<String, dynamic>);
        }),
      ),
    );
  }
}
