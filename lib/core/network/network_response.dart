abstract class NetworkResponse<T> {
  String? status;
  T? data;
  int? statusCode;
  String? message;

  NetworkResponse({this.data, this.message, this.status, this.statusCode});
}
