abstract class NetworkBodyRequest<T> {
  Map<String, dynamic> toJson();
  NetworkBodyRequest fromJson(Map<String, dynamic> json);
}
