class NetworkError {
  int statusCode;
  String? message;

  NetworkError({
    required this.statusCode,
    this.message,
  });

  NetworkErrorType get type {
    switch (statusCode) {
      case 404:
        return NetworkErrorType.notfound;
      case 401:
        return NetworkErrorType.unauthorized;
      default:
        return NetworkErrorType.unknown;
    }
  }
}

enum NetworkErrorType {
  client, // > 400
  server, // > 500
  unauthorized,
  badrequest,
  notfound,
  unknown,
}
