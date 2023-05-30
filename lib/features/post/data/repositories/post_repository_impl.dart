import 'package:clean_architecture_template/features/post/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_template/features/post/data/models/post_data.dart';
import 'package:clean_architecture_template/features/post/domain/entities/post.dart';
import 'package:clean_architecture_template/features/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImpl({required this.postRemoteDataSource});

  @override
  Future<List<Post>> getListPost({int limit = 10, int offset = 0}) async {
    List<PostData> posts = [];
    for (var i = offset; i < offset + limit; i++) {
      final json = {
        "userId": 1,
        "id": i,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body":
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      };
      posts.add(PostData.fromJson(json));
    }
    return posts;
  }

  @override
  Future<Post> getPostById(int id) async {
    return await postRemoteDataSource.getPost(id: id);
  }
}
