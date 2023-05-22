import 'package:clean_architecture_template/core/enums/handle_status.dart';
import 'package:clean_architecture_template/features/post/data/models/post_data.dart';

class PostState {
  HandleStatus status;
  PostData? post;
  String? message;

  PostState({
    this.message,
    this.post,
    this.status = HandleStatus.initial,
  });

  PostState copyWith({
    HandleStatus? status,
    PostData? post,
    String? message,
  }) {
    return PostState(
      post: post ?? this.post,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
