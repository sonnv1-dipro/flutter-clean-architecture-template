import 'package:clean_architecture_template/core/error/network_error.dart';
import 'package:clean_architecture_template/core/network/network_response.dart';

abstract class RefreshTokenCaller<T extends RefreshTokenResponse> {
  void addRefreshTokenRepository(
    Future<T> Function() cb,
  );

  void addRefreshTokenListener({
    Function(String, String)? onSuccess,
    Function(Exception)? onError,
  });

  Future<RefreshTokenResponse> refresh({required String refreshToken});
}

class RefreshTokenNetwork<T extends RefreshTokenResponse>
    implements RefreshTokenCaller<T> {
  RefreshTokenNetwork._privateConstructor();

  static final _instance = RefreshTokenNetwork._privateConstructor();

  static RefreshTokenNetwork get instance => _instance;

  Function(String, String)? _refreshTokenCallbackSuccess;
  Function(Exception)? _refreshTokenCallbackError;
  Future<T> Function()? _repositoryCallback;

  @override
  Future<T> refresh({required String refreshToken}) async {
    if (_repositoryCallback != null) {
      final result = await _repositoryCallback!.call();
      if (result.error?.type == NetworkErrorType.unauthorized) {
        _refreshTokenCallbackError?.call(Exception(result.message));
      } else if (result.isSuccess) {
        _refreshTokenCallbackSuccess?.call(
          result.getAccessToken ?? "",
          result.getRefreshToken ?? "",
        );
      }
    } else {
      return await _refreshTokenCallbackError!.call(
        Exception("Repository must be set before call refresh"),
      );
    }
    throw Exception("Repository must be set before call refresh");
  }

  @override
  void addRefreshTokenListener({
    Function(String p1, String p2)? onSuccess,
    Function(Exception p1)? onError,
  }) {
    _refreshTokenCallbackSuccess = onSuccess;
    _refreshTokenCallbackError = onError;
  }

  @override
  void addRefreshTokenRepository(
    Future<T> Function() cb,
  ) {
    _repositoryCallback = cb;
  }
}

abstract class RefreshTokenResponse extends NetworkResponse {
  String? get getAccessToken;
  String? get getRefreshToken;
}
