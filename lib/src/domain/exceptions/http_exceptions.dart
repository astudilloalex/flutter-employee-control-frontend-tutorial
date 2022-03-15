class HttpException implements Exception {
  const HttpException({
    required this.message,
    required this.prefix,
    required this.url,
  });

  final String message;
  final String prefix;
  final String url;
}

class BadRequestException extends HttpException {
  BadRequestException([String? message, String? url])
      : super(
          message: message ?? '',
          prefix: 'Bad Request',
          url: url ?? '',
        );
}

class FetchDataException extends HttpException {
  FetchDataException([String? message, String? url])
      : super(
          message: message ?? '',
          prefix: 'Unable to process',
          url: url ?? '',
        );
}

class ApiNotRespondingException extends HttpException {
  ApiNotRespondingException([String? message, String? url])
      : super(
          message: message ?? '',
          prefix: 'API not responded in time',
          url: url ?? '',
        );
}

class UnauthorizedException extends HttpException {
  UnauthorizedException([String? message, String? url])
      : super(
          message: message ?? '',
          prefix: 'Unauthorized request',
          url: url ?? '',
        );
}
