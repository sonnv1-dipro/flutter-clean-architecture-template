import 'package:clean_architecture_template/features/post/domain/entities/post.dart';

abstract class PostRepository {
  Future<Post> getPostById(int id);
  Future<List<Post>> getListPost({int limit = 10, int offset = 0});
}
