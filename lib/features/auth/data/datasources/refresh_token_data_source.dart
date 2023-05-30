import 'package:clean_architecture_template/core/network/network_caller.dart';
import 'package:clean_architecture_template/features/auth/data/models/refresh_token_model.dart';
import 'package:clean_architecture_template/features/auth/domain/entites/refresh_token_entity.dart';

abstract class RefreshTokenDataSource {
  Future<RefreshTokenEntity> getRefreshToken({String refreshToken});
}

class RefreshTokenDataSourceImplement {
  Future<RefreshTokenEntity> getRefreshToken(
      {required String refreshToken}) async {
    try {
      final api = Restful<RefreshTokenModel>()
        ..url(path: "/refresh-token")
        ..authentication()
        ..get()
        ..build();
      final resulst = await api.execute();
      return resulst;
    } catch (e) {
      rethrow;
    }
  }
}
