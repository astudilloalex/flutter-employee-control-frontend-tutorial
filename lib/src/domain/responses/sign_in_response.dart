import 'dart:convert';

import 'package:employees_control/src/domain/entities/user.dart';

SignInResponse signInResponseFromJson(String str) {
  return SignInResponse.fromJson(json.decode(str) as Map<String, dynamic>);
}

class SignInResponse {
  const SignInResponse({
    required this.status,
    required this.message,
    this.user,
    this.token,
  });

  final int status;
  final String message;
  final User? user;
  final String? token;

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    final int status = json['status'] as int;
    return SignInResponse(
      status: status,
      message: json['message'] as String,
      user: status == 200
          ? User.fromJson(
              (json['data'] as Map<String, dynamic>)['user']
                  as Map<String, dynamic>,
            )
          : null,
      token: status == 200
          ? (json['data'] as Map<String, dynamic>)['token'] as String
          : null,
    );
  }
}
