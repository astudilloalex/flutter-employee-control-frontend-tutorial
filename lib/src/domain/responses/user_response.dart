import 'dart:convert';

import 'package:employees_control/src/domain/entities/user.dart';

UserResponse userResponseFromJson(String str) {
  return UserResponse.fromJson(json.decode(str) as Map<String, dynamic>);
}

class UserResponse {
  const UserResponse({
    required this.status,
    required this.message,
    this.user,
  });

  final int status;
  final String message;
  final User? user;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    final int status = json['status'] as int;
    return UserResponse(
      status: status,
      message: json['message'] as String,
      user: status == 200
          ? User.fromJson(
              json['data'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}
