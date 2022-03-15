import 'package:employees_control/src/data/http/base_http_client.dart';
import 'package:employees_control/src/data/http/url_paths.dart';
import 'package:employees_control/src/domain/repositories/user_repository.dart';
import 'package:employees_control/src/domain/responses/user_response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserHttp implements UserRepository {
  const UserHttp({
    this.baseHttpClient = const BaseHttpClient(),
  });

  final BaseHttpClient baseHttpClient;

  @override
  Future<UserResponse> get user async {
    try {
      final http.Response response = await baseHttpClient.get(
        UrlPaths.getUser,
      );
      return compute(userResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }
}
