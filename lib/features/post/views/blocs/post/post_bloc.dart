import 'dart:developer';

import 'package:clean_architecture_template/core/enums/handle_status.dart';
import 'package:clean_architecture_template/features/post/data/models/post_data.dart';
import 'package:clean_architecture_template/features/post/domain/repositories/post_repository.dart';
import 'package:clean_architecture_template/features/post/views/blocs/post/post_event.dart';
import 'package:clean_architecture_template/features/post/views/blocs/post/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc({required this.repository}) : super(PostState()) {
    on<FetchedPostEvent>(_fetchPost);
  }

  void _fetchPost(FetchedPostEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(status: HandleStatus.loading));
      final result = await repository.getPostById(event.id);
      log(result.title);
      emit(
        state.copyWith(status: HandleStatus.success, post: result as PostData),
      );
    } catch (e) {
      emit(
        state.copyWith(status: HandleStatus.error, message: e.toString()),
      );
    }
  }
}
