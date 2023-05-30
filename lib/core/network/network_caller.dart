import 'dart:io';

import 'package:clean_architecture_template/core/error/network_error.dart';
import 'package:clean_architecture_template/core/network/network_response.dart';
import 'package:clean_architecture_template/core/network/refresh_token_caller.dart';
import 'package:dio/dio.dart';

abstract class RestfulCaller<T> {
  RestfulCaller<T> post();

  RestfulCaller<T> put();

  RestfulCaller<T> get();

  RestfulCaller<T> patch();

  RestfulCaller<T> delete();

  RestfulCaller<T> instanceJson(T Function(Map<String, dynamic>) cb);

  RestfulCaller<T> url({String url, String? path});

  RestfulCaller<T> authentication({String? token});

  RestfulCaller<T> language({String? language});

  RestfulCaller<T> query({Map<String, dynamic>? queryParams});

  RestfulCaller<T> header({required Map<String, dynamic> queryParams});

  RestfulCaller<T> addQuery({required String key, required String value});

  RestfulCaller<T> addHeader({required String key, required String value});

  RestfulCaller<T> body({Map<String, dynamic>? bodyJson});

  RestfulCaller<T> build();

  Future<T> execute();

  void cancel();
}

enum RestfulMethod { get, post, patch, put, delete }

class Restful<T> extends RestfulCaller<T> {
  static String? accessToken;
  static String? refreshToken;
  static String? acceptLanguage = "*";

  T Function(Map<String, dynamic>)? _intanceJsonCallback;

  final _dio = Dio();

  String? _url;

  final _option = Options();

  Map<String, dynamic>? _bodyJson;

  final Map<String, dynamic> _queryParameters = {};

  RestfulMethod? _method;

  @override
  RestfulCaller<T> addQuery({
    required String key,
    required String value,
  }) {
    if (_queryParameters.containsKey(key)) {
      _queryParameters[key] = value;
    } else {
      _queryParameters.addAll({key: value});
    }

    if (_queryParameters.isNotEmpty) {
      _dio.options.queryParameters = _queryParameters;
    }
    return this;
  }

  @override
  RestfulCaller<T> authentication({String? token}) {
    if (token != null) {
      _option.headers?.addAll({
        HttpHeaders.authorizationHeader: "Bearer $token",
      });
    } else if (accessToken != null) {
      _option.headers?.addAll({
        HttpHeaders.authorizationHeader: "Bearer $accessToken",
      });
    }
    return this;
  }

  @override
  RestfulCaller<T> body({Map<String, dynamic>? bodyJson}) {
    if (bodyJson == null) {
      throw Exception("Body Json could not be null");
    }
    _bodyJson = bodyJson;
    return this;
  }

  @override
  RestfulCaller<T> query({Map<String, dynamic>? queryParams}) {
    if (queryParams == null) {
      throw Exception("queryParams could not be null");
    }
    _queryParameters.addAll(queryParams);
    if (_queryParameters.isNotEmpty) {
      _dio.options.queryParameters = _queryParameters;
    }
    return this;
  }

  @override
  RestfulCaller<T> url({String? url, String? path}) {
    _url = url;
    if (path != null) {
      // get base_url from local and join with path here
    }
    return this;
  }

  @override
  void cancel() {
    _dio.close();
  }

  @override
  RestfulCaller<T> delete() {
    _method = RestfulMethod.delete;
    return this;
  }

  @override
  Future<T> execute() async {
    if (_method == null) {
      throw Exception("Method must be set before build");
    }

    if (_url == null) {
      throw Exception("url must be set before build");
    }

    switch (_method) {
      case RestfulMethod.get:
        return await _getExecute();
      case RestfulMethod.post:
        return await _postExecute();
      case RestfulMethod.delete:
        return await _deleteExecute();
      case RestfulMethod.patch:
        return await _patchExecute();
      default:
        throw Exception("Method could not found");
    }
  }

  Future<T> _getExecute() async {
    try {
      final rs = await _dio.get(_url!, options: _option);
      if (rs.data is Map<String, dynamic>?) {
        if (_intanceJsonCallback != null) {
          return _intanceJsonCallback!.call(rs.data);
        }
        return rs.data;
      } else {
        throw Exception("Data response did not match type");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final rs = _intanceJsonCallback!.call(e.response!.data);
        if (rs is NetworkResponse) {
          if (rs.error?.type == NetworkErrorType.unauthorized) {
            // refresh call back response here
            final result = await RefreshTokenNetwork.instance.refresh(
              refreshToken: Restful.refreshToken ?? "",
            );
            if (result.isSuccess) {
              return _getExecute();
            }
            throw Exception("Unauthorization");
          }
        }
        return rs;
      }
      rethrow;
    }
  }

  Future<T> _postExecute() async {
    try {
      final rs = await _dio.post(_url!, data: _bodyJson, options: _option);
      if (rs.data is Map<String, dynamic>?) {
        if (_intanceJsonCallback != null) {
          return _intanceJsonCallback!.call(rs.data);
        }
        return rs.data;
      } else {
        throw Exception("Data response did not match type");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final rs = _intanceJsonCallback!.call(e.response!.data);
        if (rs is NetworkResponse) {
          if (rs.error?.type == NetworkErrorType.unauthorized) {
            // refresh call back response here
            final result = await RefreshTokenNetwork.instance.refresh(
              refreshToken: Restful.refreshToken ?? "",
            );
            if (result.isSuccess) {
              return _postExecute();
            }
          }
        }
        return rs;
      }
      rethrow;
    }
  }

  Future<T> _deleteExecute() async {
    try {
      final rs = await _dio.delete(_url!, options: _option);
      if (rs.data is Map<String, dynamic>?) {
        if (_intanceJsonCallback != null) {
          return _intanceJsonCallback!.call(rs.data);
        }
        return rs.data;
      } else {
        throw Exception("Data response did not match type");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final rs = _intanceJsonCallback!.call(e.response!.data);
        if (rs is NetworkResponse) {
          if (rs.error?.type == NetworkErrorType.unauthorized) {
            // refresh call back response here
            final result = await RefreshTokenNetwork.instance.refresh(
              refreshToken: Restful.refreshToken ?? "",
            );
            if (result.isSuccess) {
              return _deleteExecute();
            }
          }
        }
        return rs;
      }
      rethrow;
    }
  }

  Future<T> _patchExecute() async {
    try {
      final rs = await _dio.patch(_url!, data: _bodyJson, options: _option);
      if (rs.data is Map<String, dynamic>?) {
        if (_intanceJsonCallback != null) {
          return _intanceJsonCallback!.call(rs.data);
        }
        return rs.data;
      } else {
        throw Exception("Data response did not match type");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final rs = _intanceJsonCallback!.call(e.response!.data);
        if (rs is NetworkResponse) {
          if (rs.error?.type == NetworkErrorType.unauthorized) {
            // refresh call back response here
            final result = await RefreshTokenNetwork.instance.refresh(
              refreshToken: Restful.refreshToken ?? "",
            );
            if (result.isSuccess) {
              return _patchExecute();
            }
          }
        }
        return rs;
      }
      rethrow;
    }
  }

  @override
  RestfulCaller<T> get() {
    _method = RestfulMethod.get;
    return this;
  }

  @override
  RestfulCaller<T> patch() {
    _method = RestfulMethod.patch;
    return this;
  }

  @override
  RestfulCaller<T> post() {
    _method = RestfulMethod.post;
    return this;
  }

  @override
  RestfulCaller<T> put() {
    _method = RestfulMethod.put;
    return this;
  }

  @override
  RestfulCaller<T> instanceJson(
    T Function(Map<String, dynamic> p1) cb,
  ) {
    _intanceJsonCallback = cb;
    return this;
  }

  @override
  RestfulCaller<T> build() {
    return this;
  }

  @override
  RestfulCaller<T> addHeader({required String key, required String value}) {
    // HttpHeaders.contentTypeHeader
    _option.headers?[key] = value;
    return this;
  }

  @override
  RestfulCaller<T> header({required Map<String, dynamic> queryParams}) {
    queryParams.forEach((key, value) {
      _option.headers?[key] = value;
    });
    return this;
  }

  @override
  RestfulCaller<T> language({String? language}) {
    if (language != null) {
      _option.headers?[HttpHeaders.acceptLanguageHeader] = language;
    } else if (acceptLanguage != null) {
      _option.headers?[HttpHeaders.acceptLanguageHeader] = acceptLanguage;
    }
    return this;
  }
}
