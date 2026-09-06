enum ApiErrorType {
  unauthorized,
  network,
  server,
  unknown,
}

class ApiException implements Exception {
  final ApiErrorType type;
  final String message;
  final int? statusCode;

  ApiException({
    required this.type,
    required this.message,
    this.statusCode,
  });

  @override
  String toString() {
    return 'ApiException(type: $type, message: $message, statusCode: $statusCode)';
  }
}
