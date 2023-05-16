import 'package:clean_architecture_template/core/network/network_caller.dart';
import 'package:clean_architecture_template/features/post/data/models/post_data.dart';

abstract class PostRemoteDataSource {
  Future<PostData> getPost({required int id});
}

class PostRemoteDataSourceImplement implements PostRemoteDataSource {
  @override
  Future<PostData> getPost({required int id}) async {
    try {
      final api = Restful<PostData>()
        ..instanceJson((json) => PostData.fromJson(json))
        ..url(url: "https://jsonplaceholder.typicode.com/todos/$id")
        ..get()
        ..build();

      final resulst = await api.execute();
      return resulst;
    } catch (e) {
      rethrow;
    }
  }
}
