import 'package:employees_control/src/data/http/base_http_client.dart';
import 'package:employees_control/src/data/http/url_paths.dart';
import 'package:employees_control/src/domain/repositories/sign_in_repository.dart';
import 'package:employees_control/src/domain/responses/sign_in_response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SignInHttp implements SignInRepository {
  const SignInHttp({
    this.baseHttpClient = const BaseHttpClient(),
  });

  final BaseHttpClient baseHttpClient;

  @override
  Future<SignInResponse> signInWithUsernameAndPassword(
    String username,
    String password,
  ) async {
    try {
      final http.Response response = await baseHttpClient.post(
        UrlPaths.signIn,
        request: {
          'username': username,
          'password': password,
        },
      );
      return compute(signInResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }
}
