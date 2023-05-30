import 'package:clean_architecture_template/features/post/data/models/post_data.dart';
import 'package:clean_architecture_template/features/post/views/blocs/list_post/list_post_bloc.dart';
import 'package:clean_architecture_template/features/post/views/blocs/list_post/list_post_event.dart';
import 'package:clean_architecture_template/features/post/views/blocs/list_post/list_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListPostPage extends StatefulWidget {
  const ListPostPage({super.key});

  @override
  _ListPostPageState createState() => _ListPostPageState();
}

class _ListPostPageState extends State<ListPostPage> {
  final PagingController<int, PostData> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    final event = FetchedListPostEvent();
    context.read<ListPostBloc>().add(event);

    _pagingController.addPageRequestListener((pageKey) {
      final event = FetchedListPostEvent();
      context.read<ListPostBloc>().add(event);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ListPostBloc, ListPostState>(
        builder: (context, state) {
          return PagedListView<int, PostData>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<PostData>(
              itemBuilder: (context, item, index) => ListTile(
                title: Text(state.posts![index].title),
              ),
            ),
          );
        },
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
