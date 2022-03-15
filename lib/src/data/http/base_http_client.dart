import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:employees_control/src/data/http/url_paths.dart';
import 'package:employees_control/src/data/local/secure_storage_local.dart';
import 'package:employees_control/src/domain/exceptions/http_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseHttpClient {
  const BaseHttpClient({
    this.timeout = const Duration(seconds: 10),
    this.secureStorageLocal = const SecureStorageLocal(),
  });

  final Duration timeout;
  final SecureStorageLocal secureStorageLocal;

  Future<http.Response> get(
    String path, [
    Map<String, String>? parameters,
  ]) async {
    final Uri uri = parameters == null
        ? Uri.parse('${UrlPaths.url}$path')
        : Uri.http('192.168.18.8:8080', '/api/v1$path', parameters);
    try {
      final String? token = await secureStorageLocal.jwtToken;
      final http.Response response = await http.get(
        uri,
        headers: {HttpHeaders.authorizationHeader: token ?? ''},
      ).timeout(timeout);
      if (response.statusCode == 200) {
        return Future.value(response);
      }
      throw _processResponse(
        response.statusCode,
        response.request?.url.toString() ?? uri.toString(),
      );
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('Timeout', uri.toString());
    }
  }

  Future<http.Response> post(
    String path, {
    Map<String, dynamic>? request,
    Map<String, String>? parameters,
  }) async {
    final Uri uri = parameters == null
        ? Uri.parse('${UrlPaths.url}$path')
        : Uri.http('192.168.18.8:8080', '/api/v1$path', parameters);
    try {
      final String? token = await secureStorageLocal.jwtToken;
      final http.Response response = await http
          .post(
            uri,
            headers: path == UrlPaths.signIn
                ? null
                : {
                    HttpHeaders.authorizationHeader: token ?? '',
                    'Content-Type': 'application/json',
                  },
            body: request != null ? json.encode(request) : null,
          )
          .timeout(timeout);
      if (response.statusCode == 200) {
        return Future.value(response);
      }
      throw _processResponse(
        response.statusCode,
        response.request?.url.toString() ?? uri.toString(),
        response.reasonPhrase,
      );
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('Timeout', uri.toString());
    }
  }

  Exception _processResponse(int statusCode, String url, [String? message]) {
    switch (statusCode) {
      case 400:
        return BadRequestException(
          message ?? 'Check request sent to server',
          url,
        );
      case 401:
        return UnauthorizedException(
          message ?? 'Your credentials are incorrect',
          url,
        );
      case 403:
        return UnauthorizedException(
          message ?? 'You do not have authorization',
          url,
        );
      default:
        return FetchDataException(
          message ?? 'Error ocurred with code: $statusCode',
          url,
        );
    }
  }
}
