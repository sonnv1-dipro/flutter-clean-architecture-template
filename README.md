# clean_architecture_template

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Run flutter pub get command
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```


## Generate language assets:
  More docs: [Open link](https://pub.dev/packages/easy_localization)
```bash
flutter pub run easy_localization:generate -S assets/locales
```

```bash
flutter pub run easy_localization:generate -S assets/locales -f keys -o locale_keys.g.dart
```
## Network Caller

This template support develop build an network call with restful API just buy build syntax.

```
final api = Restful<PostData>()
        ..instanceJson((json) => PostData.fromJson(json))
        ..url(url: "https://jsonplaceholder.typicode.com/todos/$id")
        ..get()
        ..build();

final resulst = await api.execute();
```
Restful take any Response Type <T>, if you want your response type extends from base model response you can make it extends from NetworkResponse:
  ```
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
```
Back to Restful api, you can use a lot of functions for your network call customation.
  ### Rest Medthod: post, get, put, patch, delete
  ### Authorization: .authentication(token: String?)
  ### Query params: .addQuer(key: String, value: String)
 
