import 'package:clean_architecture_template/features/post/domain/entities/post.dart';
import 'package:clean_architecture_template/features/post/domain/repositories/post_repository.dart';

class PostPlaceholderExample {
  PostRepository repository;

  PostPlaceholderExample({required this.repository});
  Future<Post> getPostDetail({required int id}) async {
    return repository.getPostById(id);
  }

  Future<List<Post>> getListPost({int limit = 10, int offset = 0}) async {
    return repository.getListPost(
      limit: limit,
      offset: offset,
    );
  }
}
