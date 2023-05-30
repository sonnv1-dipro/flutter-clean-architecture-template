import 'package:clean_architecture_template/core/network/refresh_token_caller.dart';

class RefreshTokenEntity extends RefreshTokenResponse {
  @override
  String? get getAccessToken => data.accessToken;

  @override
  String? get getRefreshToken => data.refreshToken;
}
