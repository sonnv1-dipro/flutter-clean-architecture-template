import 'package:clean_architecture_template/core/enums/handle_status.dart';
import 'package:clean_architecture_template/features/post/data/models/post_data.dart';

class ListPostState {
  HandleStatus status;
  List<PostData>? posts;
  String? message;

  ListPostState({
    this.message,
    this.posts,
    this.status = HandleStatus.initial,
  });

  ListPostState copyWith({
    HandleStatus? status,
    List<PostData>? posts,
    String? message,
  }) {
    return ListPostState(
      posts: posts ?? this.posts,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
