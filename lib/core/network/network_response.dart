import 'package:clean_architecture_template/core/error/network_error.dart';

class NetworkResponse<T> {
  String? status;
  T? data;
  int? statusCode;
  String? message;

  NetworkResponse({this.data, this.message, this.status, this.statusCode});

  NetworkError? get error {
    if (statusCode == null) return null;
    return NetworkError(statusCode: statusCode!, message: message);
  }
}
