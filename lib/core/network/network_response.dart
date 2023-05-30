import 'package:clean_architecture_template/core/error/network_error.dart';

class NetworkResponse<T> {
  String? status;
  T? data;
  int? statusCode;
  String? message;

  bool get isSuccess => statusCode == 200;

  NetworkResponse({this.data, this.message, this.status, this.statusCode});

  NetworkError? get error {
    if (statusCode == null) return null;
    return NetworkError(statusCode: statusCode!, message: message);
  }
}
