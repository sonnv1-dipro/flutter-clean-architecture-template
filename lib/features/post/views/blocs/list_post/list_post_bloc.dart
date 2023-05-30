import 'dart:developer';

import 'package:clean_architecture_template/core/enums/handle_status.dart';
import 'package:clean_architecture_template/features/post/data/models/post_data.dart';
import 'package:clean_architecture_template/features/post/domain/usercases/post_placeholder_example.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'list_post_event.dart';
import 'list_post_state.dart';

class ListPostBloc extends Bloc<ListPostEvent, ListPostState> {
  final PostPlaceholderExample usercase;

  ListPostBloc({
    required this.usercase,
  }) : super(ListPostState()) {
    on<FetchedListPostEvent>(_fetchPosts);
  }

  void _fetchPosts(FetchedListPostEvent event, Emitter emit) async {
    try {
      if (state.status.isInitial || event.isRefresh) {
        emit(state.copyWith(status: HandleStatus.loading));
        final result = await usercase.getListPost(
          offset: 0,
          limit: event.limit,
        );
        emit(
          state.copyWith(
            status: HandleStatus.success,
            posts: result as List<PostData>,
          ),
        );
      } else {
        emit(state.copyWith(status: HandleStatus.loading));
        final result = await usercase.getListPost(
          offset: state.posts?.length ?? 0,
          limit: event.limit,
        );
        emit(
          state.copyWith(
            status: HandleStatus.success,
            posts: state.posts?..addAll((result as List<PostData>)),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: HandleStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
