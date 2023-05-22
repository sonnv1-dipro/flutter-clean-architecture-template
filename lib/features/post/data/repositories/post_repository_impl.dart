import 'package:clean_architecture_template/features/post/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_template/features/post/domain/entities/post.dart';
import 'package:clean_architecture_template/features/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImpl({required this.postRemoteDataSource});

  @override
  Future<List<Post>> getListPost({int limit = 10, int offset = 0}) {
    // TODO: implement getListPost
    throw UnimplementedError();
  }

  @override
  Future<Post> getPostById(int id) async {
    return await postRemoteDataSource.getPost(id: id);
  }
}
