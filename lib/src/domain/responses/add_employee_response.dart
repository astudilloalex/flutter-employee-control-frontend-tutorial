import 'dart:convert';

import 'package:employees_control/src/domain/entities/user.dart';

AddEmployeeResponse addEmployeeResponseFromJson(String str) {
  return AddEmployeeResponse.fromJson(json.decode(str) as Map<String, dynamic>);
}

class AddEmployeeResponse {
  const AddEmployeeResponse({
    required this.status,
    required this.message,
    this.user,
    this.temporalPassword,
  });

  final int status;
  final String message;
  final User? user;
  final String? temporalPassword;

  factory AddEmployeeResponse.fromJson(Map<String, dynamic> json) {
    final int status = json['status'] as int;
    return AddEmployeeResponse(
      status: status,
      message: json['message'] as String,
      user: status == 200
          ? User.fromJson(
              (json['data'] as Map<String, dynamic>)['userInfo']
                  as Map<String, dynamic>,
            )
          : null,
      temporalPassword: status == 200
          ? (json['data'] as Map<String, dynamic>)['temporalPassword'] as String
          : null,
    );
  }
}
